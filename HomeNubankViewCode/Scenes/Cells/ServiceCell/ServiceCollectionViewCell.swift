import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    static let resuseIdentifier = String(describing: ServiceCollectionViewCell.self)
    
    lazy var serviceView: ServiceCellView = {
        return ServiceCellView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupServiceCell(model: ServiceModel) {
        serviceView.serviceImage.image = UIImage(systemName: model.serviceImage)
        serviceView.serviceLabelName.text = model.serviceName
    }
}

extension ServiceCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(serviceView)
    }
    
    func setupConstrains() {
        serviceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            serviceView.topAnchor.constraint(equalTo: contentView.topAnchor),
            serviceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            serviceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            serviceView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
    }
}
