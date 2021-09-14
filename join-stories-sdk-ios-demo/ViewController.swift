import UIKit
import SnapKit
import JoinStoriesSDK

class ViewController: UIViewController, StoryScaffoldDelegate {
    
    var activityIndicator = UIActivityIndicatorView()
    
    var scaffolder: StoriesScaffolder!
    
    let storiesApi: StoriesApiSpec = StoriesApi()
    
    var scaffolderView=UIView()
    
    // Variables to modify according to the widget settings
    let joinTeam = "join-showcase"
    let joinAlias = "widget-test-sdk"

    
    @objc func willEnterForeground() {
        // We re-load stories when the app re-open
        scaffolderView.removeFromSuperview()
        
        storiesApi.fetchStories(fromTeam: joinTeam, withAlias: joinAlias) { [weak self] stories in
            self?.activityIndicator.stopAnimating()
            self?.scaffoldStories(withStories: stories)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a notification observer to know when the app is becoming active
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .black
        
        // Create an optional loader in case of bad network condition
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
        }
        
        // On Load, fetch the stories from the Join public API
        storiesApi.fetchStories(fromTeam: joinTeam, withAlias: joinAlias) { [weak self] stories in
            self?.activityIndicator.stopAnimating()
            self?.scaffoldStories(withStories: stories)
        }
    }
    
    func scaffoldStories(withStories stories: [StoryValue]) {
        scaffolder = StoriesScaffolder()
        // Configure here how the widget is displayed, the dimension, the color of the label and the border
        let storyConfig = StoryViewConfig(
            containerDimension: 150,
            dividerWidth: 10,
            // fontName: "HelveticaNeue-Bold",
            labelColor: UIColor.gray,
            // withLabel: false,
            innerBorderColor : [UIColor.white],
            outterBorderColor : [UIColor.red, UIColor.blue],
            innerBorderWidth: 2,
            outterBorderWidth: 3
        )
        
        // Create the widget element
        scaffolder
            .withConfig(storyConfig)
            .buildScroller(withStories: stories, andDelegate: self)
        
        // Add the widget to the view
        scaffolderView=scaffolder
        self.view.addSubview(scaffolder)
        
        // Set here the position of the widget in the view
        scaffolder.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(50)
            make.width.equalTo(self.view)
            make.height.equalTo(scaffolder.config.containerDimension)
        }
    }
    
    func onStorySelected(story: StoryValue) {
        self.presentStoryPlayerController(story: story, animated: true)
    }
    
}
