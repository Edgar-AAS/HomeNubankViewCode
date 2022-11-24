import UIKit

class NoticiesTableViewCell: UITableViewCell {
    private var collectionView: UICollectionView!
    static let reuseIdentifier = String(describing: NoticiesTableViewCell.self)
    private let viewModel = NoticiesViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCollectionView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var findOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descubra mais"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private func configCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        collectionView.register(NoticiesCollectionViewCell.self, forCellWithReuseIdentifier: NoticiesCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.frame = contentView.bounds
    }
}

extension NoticiesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let labelEdges: CGFloat = 40
        let labelOccupiedSpace = findOutLabel.frame.size.height + labelEdges
        return CGSize(width: (frame.size.width) / 1.5, height: (frame.size.height-labelOccupiedSpace) - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

extension NoticiesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoticiesCollectionViewCell.reuseIdentifier, for: indexPath) as? NoticiesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupNoticiesCell(model: viewModel.getCurrentNoticie(indexPath: indexPath))
        return cell
    }
}

extension NoticiesTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(findOutLabel)
        contentView.addSubview(collectionView)
    }
    
    func setupConstrains() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            findOutLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            findOutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            findOutLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: findOutLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
