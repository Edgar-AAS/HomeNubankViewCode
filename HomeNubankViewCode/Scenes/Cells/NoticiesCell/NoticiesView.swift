import UIKit

class NoticiesView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "NubankImage4")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nubank celular seguro"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    lazy var newsDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100% cobertura, 0% estresse. Simule agora mesmo."
        label.textColor = UIColor(hexString: "727583")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var findOutButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Conhecer", for: .normal)
        button.backgroundColor = UIColor(hexString: "8224D0")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
}

extension NoticiesView: CodeView {
    func buildViewHierarchy() {
        addSubview(newsImage)
        addSubview(newsLabel)
        addSubview(newsDescriptionLabel)
        addSubview(findOutButton)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45),
            
            newsLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10),
            newsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            newsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            newsDescriptionLabel.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 10),
            newsDescriptionLabel.leadingAnchor.constraint(equalTo: newsLabel.leadingAnchor),
            newsDescriptionLabel.trailingAnchor.constraint(equalTo: newsLabel.trailingAnchor),
            
            findOutButton.topAnchor.constraint(equalTo: newsDescriptionLabel.bottomAnchor, constant: 20),
            findOutButton.leadingAnchor.constraint(equalTo: newsDescriptionLabel.leadingAnchor),
            findOutButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            findOutButton.heightAnchor.constraint(equalToConstant: 36),
            findOutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func setupAdditionalConfiguration() {
        findOutButton.contentEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
    }
}
