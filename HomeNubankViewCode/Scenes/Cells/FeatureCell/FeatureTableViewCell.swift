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
    
    private lazy var featureView: FeatureCellView = {
        return FeatureCellView()
    }()
    
    private lazy var separatorLineView: SeparatorLineView = {
        return SeparatorLineView()
    }()
}

extension FeatureTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(featureView)
        contentView.addSubview(separatorLineView)
    }
    
    func setupConstrains() {
        featureView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            featureView.topAnchor.constraint(equalTo: contentView.topAnchor),
            featureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            featureView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            separatorLineView.topAnchor.constraint(equalTo: featureView.bottomAnchor),
            separatorLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
