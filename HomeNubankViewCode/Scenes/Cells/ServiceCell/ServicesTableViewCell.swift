import UIKit

class ServicesTableViewCell: UITableViewCell {
    private var collectionView: UICollectionView!
    static let reuseIdentifier = String(describing: ServicesTableViewCell.self)
    
    private let viewModel = ServiceViewModel()
    
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
        collectionView.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: ServiceCollectionViewCell.resuseIdentifier)
        collectionView.contentInset = .init(top: 0, left: 10, bottom: 0, right: 0)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = contentView.bounds
    }
}

extension ServicesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCollectionViewCell.resuseIdentifier, for: indexPath) as? ServiceCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupServiceCell(model: viewModel.getCurrentService(indexPath: indexPath))
        return cell
    }
}

extension ServicesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width/4.5, height: frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension ServicesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.getCurrentService(indexPath: indexPath))
    }
}

extension ServicesTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    
    func setupConstrains() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
    }
}
