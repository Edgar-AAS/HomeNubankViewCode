import UIKit

class NoticiesCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: NoticiesCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let noticiesView: NoticiesView = {
        return NoticiesView()
    }()
    
    func setupNoticiesCell(model: NoticiesModel) {
        noticiesView.newsImage.image = UIImage(named: model.newsImageName)
        noticiesView.newsLabel.text = model.newsTextLabel
        noticiesView.newsDescriptionLabel.text = model.descriptionTextLabel
        noticiesView.findOutButton.setTitle(model.buttonTitle, for: .normal)
    }
}

extension NoticiesCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(noticiesView)
    }
    
    func setupConstrains() {
        noticiesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            noticiesView.topAnchor.constraint(equalTo: contentView.topAnchor),
            noticiesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            noticiesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            noticiesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = UIColor(hexString: "EFF1F6")
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
    }
}
