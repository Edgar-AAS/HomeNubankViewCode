import UIKit

class BalanceCellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Conta"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var amountlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
}

extension BalanceCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(accountLabel)
        addSubview(amountlabel)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            accountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            accountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            accountLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            amountlabel.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            amountlabel.leadingAnchor.constraint(equalTo: accountLabel.leadingAnchor),
            amountlabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            amountlabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -20)
        ])
    }
}
