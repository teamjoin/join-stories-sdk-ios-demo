import UIKit
import JOINStoriesSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        JOINStoriesConfiguration.setValues(teamId: "join-showcase-sdk")
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            createNavController(for: MainViewController(), title: "Home", image: UIImage(systemName: "house")!),
            createNavController(for: MultiThumbViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: PlayerOnlyViewController(), title: "Settings", image: UIImage(systemName: "gearshape")!)
        ]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    
}
