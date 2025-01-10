import JOINStoriesSDK
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        JOINStoriesConfiguration.setValues(teamId: "join-showcase-sdk")
        return true
        
    }
}
