import JOINStoriesSDK
import UIKit

class MultiThumbViewController: UIViewController {

    private var scrollView: UIScrollView!
    
    private var firstThumbView: BubbleTriggerView!
    private var cardView: TriggerCardView!
    private var listView: TriggerListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JOINStoriesListener.setDelegate(delegate: self)

        let config = JoinStoriesBubbleConfigurations(
            labelFont: UIFont.jsAvenir(type: .avenirBlack, size: 12),
            labelColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
            loaderColors: [UIColor(red: 84/255, green: 157/255, blue: 247/255, alpha: 1).cgColor, UIColor(red: 84/255, green: 157/255, blue: 247/255, alpha: 1).cgColor],
            loaderWidth: 4
        )
        
        let cardConfig = TriggerListConfigurationValues(
            showPlayButton: false
        )
        
        let playerConfig = JoinStoriesPlayerConfigurations(
            playerBackgroundColor: UIColor(hex: "#FFFFFFAA")!,
            playerHorizontalMargins: 8,
            playerCornerRadius: 8
        )
        

        firstThumbView = BubbleTriggerView(config, playerConfig, alias: "welcome-showcase")
        cardView = TriggerCardView(alias: "welcome-showcase")
        listView = TriggerListView(cardConfig, alias: "welcome-showcase")

        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        scrollView.addSubview(firstThumbView)
        scrollView.addSubview(listView)
        scrollView.addSubview(cardView)

        firstThumbView.translatesAutoresizingMaskIntoConstraints = false
        listView.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstThumbView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            firstThumbView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            firstThumbView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            firstThumbView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            listView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            listView.topAnchor.constraint(equalTo: firstThumbView.bottomAnchor, constant: 10),
            listView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            cardView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            cardView.topAnchor.constraint(equalTo: listView.bottomAnchor, constant: 10),
            cardView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
}

extension MultiThumbViewController: JOINStoriesListenerDelegate {
    
    func onTriggerAnalyticsCallback(model: TriggerAnalyticsModel) {
        print("onTriggerAnalyticsCallback event: \(model.eventType)")
    }
    
    func onPlayerAnalyticsCallback(model: PlayerAnalyticsModel) {
        print("onPlayerAnalyticsCallback event: \(model.eventType) \(model.cpTitle) \(model.eventOwner)")
    }
    
    func onTriggerFetchError(message: String) {
        print("onTriggerFetchError")
    }
    
    func onTriggerFetchEmpty(message: String) {
        print("onTriggerFetchEmpty")
    }
    
    func onPlayerFetchError(message: String) {
        print("onPlayerFetchError")
    }
    
    func onContentLinkClick(url: String) -> Bool {
        print("onContentLinkClick url: \(url)")
        JOINStories.dismissPlayer()
        
        return true
    }
    
    func onPlayerDismissed(type: PlayerDismissedType) {
        print("onPlayerDismissed type: \(type)")
    }
    
    func onTriggerFetchSuccess(itemCount: Int) {
        print("onTriggerFetchSuccess")
    }
    
    func onPlayerLoaded() {
        print("onPlayerLoaded")
    }
    
    func onPlayerFetchSuccess() {
        print("onPlayerFetchSuccess")
    }
    
    func gridTriggerDesiredContentHeight(gridTriggerHeight: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            sSelf.cardView.heightAnchor.constraint(equalToConstant: gridTriggerHeight).isActive = true
        }
    }
}
