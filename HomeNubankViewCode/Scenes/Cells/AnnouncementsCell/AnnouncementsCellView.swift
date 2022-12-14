import UIKit

class AnnouncementsCellView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var announcementsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = UIColor(hexString: "EFF1F6")
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var announcementsLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
}

extension AnnouncementsCellView: CodeView {
    func buildViewHierarchy() {
        addSubview(announcementsView)
        announcementsView.addSubview(announcementsLabel)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            announcementsView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            announcementsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            announcementsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            announcementsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            announcementsLabel.topAnchor.constraint(equalTo: announcementsView.topAnchor, constant: 20),
            announcementsLabel.leadingAnchor.constraint(equalTo: announcementsView.leadingAnchor, constant: 20),
            announcementsLabel.trailingAnchor.constraint(equalTo: announcementsView.trailingAnchor, constant: -20),
            announcementsLabel.bottomAnchor.constraint(equalTo: announcementsView.bottomAnchor, constant: -20),
        ])
    }
}
