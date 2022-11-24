import UIKit

class CreditCardCellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var creditCardNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Cartão de crédito"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var balanceStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Saldo positivo"
        label.textColor = UIColor(hexString: "727583")
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "R$ 5,00"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var avaiableLimitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Limite disponivel de R$ 1.505,00"
        label.textColor = UIColor(hexString: "727583")
        return label
    }()

    lazy var splitPurchasesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Parcelar compras", for: .normal)
        button.backgroundColor = UIColor(hexString: "EFF1F6")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var stackView = makeVerticalStackView(with: [balanceStatusLabel, amountLabel, avaiableLimitLabel])
    
}

extension CreditCardCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(creditCardNameLabel)
        addSubview(stackView)
        addSubview(splitPurchasesButton)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            creditCardNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            creditCardNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            creditCardNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: creditCardNameLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: creditCardNameLabel.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: creditCardNameLabel.trailingAnchor),
            
            splitPurchasesButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            splitPurchasesButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            splitPurchasesButton.heightAnchor.constraint(equalToConstant: 44),
            splitPurchasesButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20),
            splitPurchasesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func setupAdditionalConfiguration() {
        splitPurchasesButton.contentEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
    }
}


extension CreditCardCellView {
    func makeVerticalStackView(with views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }
}
