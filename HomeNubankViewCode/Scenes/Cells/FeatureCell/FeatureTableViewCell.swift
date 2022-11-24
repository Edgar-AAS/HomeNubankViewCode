import UIKit

class FeatureTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: FeatureTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var featureView: FeatureCellView = {
        return FeatureCellView()
    }()
}

extension FeatureTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(featureView)
    }
    
    func setupConstrains() {
        featureView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            featureView.topAnchor.constraint(equalTo: contentView.topAnchor),
            featureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            featureView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            featureView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
