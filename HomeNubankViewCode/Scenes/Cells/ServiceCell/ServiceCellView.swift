import UIKit

class ServiceCellView: UIView {
    lazy var serviceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "EFF1F6")
        return view
    }()
    
    lazy var serviceImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.tintColor = .black
        return imageView
    }()
    
    lazy var serviceLabelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recarga de celular"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        serviceView.layer.cornerRadius = serviceView.bounds.size.width / 2
        serviceView.clipsToBounds = true
    }
}

extension ServiceCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(serviceView)
        serviceView.addSubview(serviceImage)
        addSubview(serviceLabelName)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            serviceView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            serviceView.centerXAnchor.constraint(equalTo: centerXAnchor),
            serviceView.heightAnchor.constraint(equalToConstant: 70),
            serviceView.widthAnchor.constraint(equalToConstant: 70),
            
            serviceImage.heightAnchor.constraint(equalToConstant: 24),
            serviceImage.widthAnchor.constraint(equalToConstant: 24),
            serviceImage.centerXAnchor.constraint(equalTo: serviceView.centerXAnchor),
            serviceImage.centerYAnchor.constraint(equalTo: serviceView.centerYAnchor),
            
            serviceLabelName.topAnchor.constraint(equalTo: serviceView.bottomAnchor, constant: 5),
            serviceLabelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            serviceLabelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            serviceLabelName.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
