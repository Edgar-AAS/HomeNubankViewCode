import UIKit

class CreditCardTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: CreditCardTableViewCell.self)
    private let viewModel = CreditCardCellViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var creditCardView: CreditDebitCardView = {
        return CreditDebitCardView(
            cardText: "Cartão de crédito",
            balanceStatusText: "Saldo positivo",
            amountText: viewModel.getAmountText,
            limitText: "Limite disponivel de: \(viewModel.getLimitAmountText)"
        )
    }()

    private lazy var separatorLineView: SeparatorLineView = {
        return SeparatorLineView()
    }()
}

extension CreditCardTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(creditCardView)
        contentView.addSubview(separatorLineView)
    }
    
    func setupConstrains() {
        creditCardView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            creditCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            creditCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            creditCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            separatorLineView.topAnchor.constraint(equalTo: creditCardView.bottomAnchor),
            separatorLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
