import UIKit

private enum HomeCellsType: Int {
    case balanceCell
    case serviceCell
    case myCardsCell
    case announcementsCell
    case creditCardCell
    case featureCell
    case noticiesCell
}

class HomeViewController: UIViewController, UIScrollViewDelegate {
    private var tableview: UITableView!
    private var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupHeader()
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableview.addSubview(refreshControl)
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        DispatchQueue.main.async {
            self.tableview.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    private func setupHeader() {
        let header = HomeTableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        tableview.tableHeaderView = header
    }
    
    private func setupTableView() {
        tableview = UITableView(frame: .zero, style: .grouped)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.backgroundColor = .white
        tableview.showsVerticalScrollIndicator = false
        tableview.allowsSelection = false
        tableview.register(ServicesTableViewCell.self, forCellReuseIdentifier: ServicesTableViewCell.reuseIdentifier)
        tableview.register(BalanceTableViewCell.self, forCellReuseIdentifier: BalanceTableViewCell.reuseIdentifier)
        tableview.register(MyCardsTableViewCell.self, forCellReuseIdentifier: MyCardsTableViewCell.reuseIdentifier)
        tableview.register(AnnouncementsTableViewCell.self, forCellReuseIdentifier: AnnouncementsTableViewCell.reuseIdentifier)
        tableview.register(CreditCardTableViewCell.self, forCellReuseIdentifier: CreditCardTableViewCell.reuseIdentifier)
        tableview.register(FeatureTableViewCell.self, forCellReuseIdentifier: FeatureTableViewCell.reuseIdentifier)
        tableview.register(NoticiesTableViewCell.self, forCellReuseIdentifier: NoticiesTableViewCell.reuseIdentifier)
        view = tableview
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableview.tableHeaderView as? HomeTableViewHeader else { return }
        header.scrollViewDidScroll(scrollView: tableview)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCells = HomeCellsType(rawValue: indexPath.row)
        switch homeCells {
        case .balanceCell:
            let balanceCell = tableView.dequeueReusableCell(withIdentifier: BalanceTableViewCell.reuseIdentifier, for: indexPath) as? BalanceTableViewCell
            let viewModel = BalanceCellViewModel()
            balanceCell?.setupBalanceCell(viewModel: viewModel)
            balanceCell?.accessoryType = .disclosureIndicator
            return balanceCell ?? UITableViewCell()
        case .serviceCell:
            let servicesCell = tableView.dequeueReusableCell(withIdentifier: ServicesTableViewCell.reuseIdentifier, for: indexPath)  as? ServicesTableViewCell
            return servicesCell ?? UITableViewCell()
        case .myCardsCell:
            let myCardsCell = tableView.dequeueReusableCell(withIdentifier: MyCardsTableViewCell.reuseIdentifier, for: indexPath) as? MyCardsTableViewCell
            return myCardsCell ?? UITableViewCell()
        case .announcementsCell:
            let announcementsCell = tableView.dequeueReusableCell(withIdentifier: AnnouncementsTableViewCell.reuseIdentifier, for: indexPath) as? AnnouncementsTableViewCell
            return announcementsCell ?? UITableViewCell()
        case .creditCardCell:
            let creditCardCell = tableView.dequeueReusableCell(withIdentifier: CreditCardTableViewCell.reuseIdentifier, for: indexPath) as? CreditCardTableViewCell
            creditCardCell?.accessoryType = .disclosureIndicator
            return creditCardCell ?? UITableViewCell()
        case .featureCell:
            let featureCell = tableView.dequeueReusableCell(withIdentifier: FeatureTableViewCell.reuseIdentifier, for: indexPath) as? FeatureTableViewCell
            return featureCell ?? UITableViewCell()
        case .noticiesCell:
            let noticiesCell = tableView.dequeueReusableCell(withIdentifier: NoticiesTableViewCell.reuseIdentifier, for: indexPath) as? NoticiesTableViewCell
            return noticiesCell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    
}
