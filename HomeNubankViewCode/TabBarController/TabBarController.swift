import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let viewControllerArray: [UIViewController]? = [
            HomeViewController(),
            AssetsViewController(),
            OffersViewController()
        ]
        
        setViewControllers(viewControllerArray, animated: true)
        tabBar.backgroundColor = .clear
        tabBar.isOpaque = false
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "arrow.up.arrow.down")
        items[1].image = UIImage(systemName: "dollarsign.circle")
        items[2].image = UIImage(systemName: "bag")
    }
}

