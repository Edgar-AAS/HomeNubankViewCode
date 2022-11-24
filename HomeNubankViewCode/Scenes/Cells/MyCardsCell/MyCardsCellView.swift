import UIKit

class MycardsCellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureButtonEdges()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var myCardsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Meus Cartões", for: .normal)
        button.setImage(UIImage(systemName: "creditcard"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.backgroundColor = UIColor(hexString: "EFF1F6")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        
        return button
    }()
    
    func configureButtonEdges() {
        myCardsButton.contentHorizontalAlignment = .fill
        myCardsButton.contentVerticalAlignment = .fill
        
        myCardsButton.imageEdgeInsets = .init(top: 15, left: 15, bottom: 15, right: 0)
        myCardsButton.titleEdgeInsets = .init(top: 0, left: 25, bottom: 0, right: 0)
    }
}

extension MycardsCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(myCardsButton)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            myCardsButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            myCardsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            myCardsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            myCardsButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
