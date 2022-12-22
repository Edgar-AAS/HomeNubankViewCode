import UIKit

class BalanceTableViewCell: UITableViewCell {
    
    lazy var balanceView: BalanceCellView = {
        return BalanceCellView()
    }()
    
    static let reuseIdentifier = String(describing: BalanceTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBalanceCell(viewModel: BalanceCellViewModel?) {
        guard let viewModel = viewModel else { return }
        balanceView.amountlabel.text = viewModel.getFormattedBalance()
    }
}

extension BalanceTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(balanceView)
    }
    
    func setupConstrains() {
        balanceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: contentView.topAnchor),
            balanceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            balanceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            balanceView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
