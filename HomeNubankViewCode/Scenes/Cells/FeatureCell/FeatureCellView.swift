import UIKit

class FeatureCellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupButtonEdges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    lazy var followTooLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Acompanhe também"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var paymentAssistantButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "dollarsign.circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitle("Assistente de pagamentos", for: .normal)
        button.backgroundColor = UIColor(hexString: "EFF1F6")
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.titleLabel?.textAlignment = .left
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    
    func setupButtonEdges() {
        paymentAssistantButton.contentHorizontalAlignment = .fill
        paymentAssistantButton.contentVerticalAlignment = .fill
        
        paymentAssistantButton.imageEdgeInsets = .init(top: 10, left: 20, bottom: 10, right: 0)
        paymentAssistantButton.titleEdgeInsets = .init(top: 0, left: 40, bottom: 0, right: 0)
    }
}

extension FeatureCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(followTooLabel)
        addSubview(paymentAssistantButton)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            followTooLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            followTooLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            followTooLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            paymentAssistantButton.topAnchor.constraint(equalTo: followTooLabel.bottomAnchor, constant: 20),
            paymentAssistantButton.leadingAnchor.constraint(equalTo: followTooLabel.leadingAnchor),
            paymentAssistantButton.trailingAnchor.constraint(equalTo: followTooLabel.trailingAnchor),
            paymentAssistantButton.heightAnchor.constraint(equalToConstant: 60),
            paymentAssistantButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

