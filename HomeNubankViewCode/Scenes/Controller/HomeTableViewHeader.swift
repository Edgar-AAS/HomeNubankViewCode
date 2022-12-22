import UIKit

class HomeTableViewHeader: UIView {
    static let reuseIdentifier = String(describing: HomeTableViewHeader.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var resourceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "8225D2")
        return view
    }()
    
    lazy var hideValueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.backgroundColor = .clear
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    lazy var inviteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person.badge.plus"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person"), for: .normal)
        button.backgroundColor = UIColor(hexString: "9B2EFE")
        button.contentMode = .scaleAspectFit
        button.tintColor = .white
        return button
    }()
    
    lazy var stackView = makeHorizontalStackView(with: [
        hideValueButton,
        helpButton,
        inviteButton
    ])
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Olá, Edgar"
        label.textColor = .white
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileButton.layer.cornerRadius = profileButton.frame.size.width / 2
        profileButton.clipsToBounds = true
    }
    
    private var resourceViewHeight = NSLayoutConstraint()
    private var resourceViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
}

extension HomeTableViewHeader: CodeView {
    func buildViewHierarchy() {
        addSubview(containerView)
        resourceView.addSubview(profileButton)
        resourceView.addSubview(stackView)
        resourceView.addSubview(userNameLabel)
        containerView.addSubview(resourceView)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.widthAnchor.constraint(equalTo: resourceView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        resourceView.translatesAutoresizingMaskIntoConstraints = false
        resourceViewBottom = resourceView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        resourceViewBottom.isActive = true
        resourceViewHeight = resourceView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        resourceViewHeight.isActive = true
        
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            profileButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant:  20),
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.widthAnchor.constraint(equalToConstant: 50),
            
            resourceView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: profileButton.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            userNameLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: 40),
            userNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            userNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            userNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
        ])
    }
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        resourceViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        resourceViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}

extension HomeTableViewHeader {
    func makeHorizontalStackView(with views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }
}

