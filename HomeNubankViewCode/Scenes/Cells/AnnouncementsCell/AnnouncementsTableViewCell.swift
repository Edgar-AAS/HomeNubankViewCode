import UIKit

class AnnouncementsTableViewCell: UITableViewCell {
    private var collectionView: UICollectionView!
    static let reuseIdentifier = String(describing: AnnouncementsTableViewCell.self)
    private let viewModel = AnnouncementsViewModel()
    
    private lazy var separatorLineView: SeparatorLineView = {
        return SeparatorLineView()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCollectionView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        collectionView.register(AnnouncementsCollectionViewCell.self, forCellWithReuseIdentifier: AnnouncementsCollectionViewCell.reuseIdentifier)
        collectionView.contentInset = .init(top: 0, left: 10, bottom: 0, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = contentView.bounds
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
    }
}

extension AnnouncementsTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(collectionView)
        contentView.addSubview(separatorLineView)
    }
    
    func setupConstrains() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
            separatorLineView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
            separatorLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorLineView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        collectionView.backgroundColor = .white
        contentView.backgroundColor = .white
    }
}

extension AnnouncementsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width/1.2, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension AnnouncementsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnouncementsCollectionViewCell.reuseIdentifier, for: indexPath) as? AnnouncementsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupAnnouncementCell(model: viewModel.getCurrentAnnouncement(indexPath: indexPath))
        return cell
    }
}
