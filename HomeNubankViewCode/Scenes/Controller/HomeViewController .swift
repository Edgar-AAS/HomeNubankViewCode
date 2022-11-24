import UIKit

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
        tableview.allowsMultipleSelection = true
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let accountCell = tableView.dequeueReusableCell(withIdentifier: BalanceTableViewCell.reuseIdentifier, for: indexPath) as? BalanceTableViewCell else {
                return UITableViewCell()
            }
            accountCell.selectionStyle = .none
            accountCell.accessoryType = .disclosureIndicator
            return accountCell
        case 1:
            guard let servicesCell = tableView.dequeueReusableCell(withIdentifier: ServicesTableViewCell.reuseIdentifier, for: indexPath)  as? ServicesTableViewCell  else {
                return UITableViewCell() }
            servicesCell.selectionStyle = .none
            return servicesCell
        case 2:
            guard let myCardsCell = tableView.dequeueReusableCell(withIdentifier: MyCardsTableViewCell.reuseIdentifier, for: indexPath) as? MyCardsTableViewCell else { return UITableViewCell() }
            myCardsCell.selectionStyle = .none
            return myCardsCell
        case 3:
            guard let announcementsCell = tableView.dequeueReusableCell(withIdentifier: AnnouncementsTableViewCell.reuseIdentifier, for: indexPath) as? AnnouncementsTableViewCell else { return UITableViewCell() }
            announcementsCell.selectionStyle = .none
            return announcementsCell
        case 4:
            guard let creditCardCell = tableView.dequeueReusableCell(withIdentifier: CreditCardTableViewCell.reuseIdentifier, for: indexPath) as? CreditCardTableViewCell else { return UITableViewCell() }
            creditCardCell.selectionStyle = .none
            creditCardCell.accessoryType = .disclosureIndicator
            return creditCardCell
        case 5:
            guard let featureCell = tableView.dequeueReusableCell(withIdentifier: FeatureTableViewCell.reuseIdentifier, for: indexPath) as? FeatureTableViewCell else { return UITableViewCell() }
            featureCell.selectionStyle = .none
            return featureCell
        case 6:
            guard let noticiesCell = tableView.dequeueReusableCell(withIdentifier: NoticiesTableViewCell.reuseIdentifier, for: indexPath) as? NoticiesTableViewCell else { return UITableViewCell() }
            noticiesCell.selectionStyle = .none
            return noticiesCell
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
