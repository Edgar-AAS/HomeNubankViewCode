import UIKit

class MyCardsTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: MyCardsTableViewCell.self)
    
    lazy var myCardsView: MycardsCellView = {
        return MycardsCellView()
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyCardsTableViewCell: CodeView {
    func buildViewHierarchy() {
        contentView.addSubview(myCardsView)
    }
    
    func setupConstrains() {
        myCardsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myCardsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            myCardsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myCardsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myCardsView.heightAnchor.constraint(equalToConstant: 100),
            myCardsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
