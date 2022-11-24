import UIKit

class CreditCardTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: CreditCardTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var creditCardView: CreditCardCellView = {
        return CreditCardCellView()
    }()
}

extension CreditCardTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(creditCardView)
    }
    
    func setupConstrains() {
        creditCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            creditCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            creditCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            creditCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            creditCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
