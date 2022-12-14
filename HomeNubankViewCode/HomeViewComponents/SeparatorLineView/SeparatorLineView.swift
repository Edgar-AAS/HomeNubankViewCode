import UIKit

class SeparatorLineView: UIView, CodeView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "EFF1F6")
        return view
    }()
    
    
    func buildViewHierarchy() {
        addSubview(separatorView)
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 2),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
