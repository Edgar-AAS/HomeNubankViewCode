import UIKit

class AnnouncementsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: AnnouncementsCollectionViewCell.self)
    
    lazy var annoucementsView: AnnouncementsCellView = {
        return AnnouncementsCellView()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAnnouncementCell(model: AnnouncementsModel) {
        annoucementsView.announcementsLabel.text = model.announcementDescription
    }
}

extension AnnouncementsCollectionViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(annoucementsView)
    }
    
    func setupConstrains() {
        annoucementsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            annoucementsView.topAnchor.constraint(equalTo: contentView.topAnchor),
            annoucementsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            annoucementsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            annoucementsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        contentView.backgroundColor = .white
    }
}
