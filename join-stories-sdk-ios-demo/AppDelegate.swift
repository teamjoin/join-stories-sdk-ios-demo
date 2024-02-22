import UIKit
import JOINStoriesSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        JOINStoriesConfiguration.setValues(teamId: "join-test-sdk-new")
        
        let navigationController = UINavigationController()
        let mainView = MainViewController(nibName: nil, bundle: nil)
        navigationController.viewControllers = [mainView]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}
