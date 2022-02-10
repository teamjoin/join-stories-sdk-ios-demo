import UIKit
import SnapKit
import JoinStoriesSDK

class ViewController: StoryTransitionViewController {
    
    var activityIndicator = UIActivityIndicatorView()
        
    let storiesApi: StoriesApiSpec = StoriesApi()
                
    let storyConfig = StoryViewConfig(
        containerDimension: 150,
        labelColor: UIColor.gray,
        thumbViewSpacing: 32,
        loaderInnerViewColor : [UIColor.black],
        loaderColors : [UIColor.red, UIColor.blue],
        loaderInnerViewWidth: 2,
        loaderWidth: 3,
        storyViewedIndicatorColor: UIColor.gray,
        storyViewedIndicatorAlpha: 0.8,
        thumbViewOverlayColor: UIColor(hex8: 0x4C4C4CBB)
    )
        
    // Variables to modify according to the widget settings
    let joinTeam = "join-showcase"
    let joinAlias = "widget-test-sdk"

    @objc func willEnterForeground() {
        // We re-load stories when the app re-open
        storiesApi.fetchStories(fromTeam: joinTeam, withAlias: joinAlias) { [weak self] stories in
            self?.activityIndicator.stopAnimating()
            self?.stories = stories
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add view controller as DataSource of `collectionView`
        collectionView.dataSource = self
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
            self?.stories = stories
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
            
}

// MARK: UICollectionViewDelegateFlowLayout

/// UICollectionViewDelegateFlowLayout should be implemented to match storyConfig parameters
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: storyConfig.getThumbAndLabelDimensions().0,
               height: storyConfig.containerDimension)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(storyConfig.getThumbViewSpacing())
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    /// Configure cell with ratio between height and width of the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.reuseIdentifier, for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        let story = self.stories[indexPath.item]
        cell.setupCell(storyValue: story, with: storyConfig, ratio: 0.7)
        return cell
    }
}
