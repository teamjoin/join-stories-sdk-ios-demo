import JoinStoriesSDK
import UIKit

class MultiThumbViewController: UIViewController {
    
    private var stackView: UIStackView!
    private let stackViewSpacing: CGFloat = 8
    private let thumbViewHeight: CGFloat = 150
    private var contentViewHeight: CGFloat {
        stackViewSpacing + (thumbViewHeight * 2)
    }
    
    let firstThumbView = BasicThumbViewController()
    let secondThumbView = ThumbViewController()
    
    let config = JoinStoriesThumbConfig(
        alias: "widget-sdk-test-thumb",
        requestTimeoutInterval: 15,
        containerDimension: 150,
        labelColor: UIColor.white,
        thumbViewSpacing: 32,
        loaderInnerViewColor : [UIColor.black],
        loaderColors : [UIColor.red, UIColor.blue],
        loaderInnerViewWidth: 2,
        loaderWidth: 3,
        storyViewedIndicatorColor: UIColor.gray,
        storyViewedIndicatorAlpha: 0.8,
        thumbViewOverlayColor: UIColor(hex8: 0x4C4C4CBB),
        playerBackgroundColor: .black.withAlphaComponent(0.3),
        playerVerticalAnchor: .center,
        playerShowShareButton: true,
        playerClosingButton: false,
        playerHorizontalMargins:10,
        playerCornerRadius:30,
        playerProgressBarDefaultColor:"#FFFFFF",
        playerProgressBarFillColor:"#026EDA",
        playerProgressBarThickness:4,
        playerProgressBarRadius:8
    )
    
    let secondConfig = JoinStoriesThumbConfig(
        alias: "widget-test-sdk",
        requestTimeoutInterval: 15,
        containerDimension: 150,
        labelColor: UIColor.blue,
        thumbViewSpacing: 32,
        loaderInnerViewColor : [UIColor.black],
        loaderColors : [UIColor.cyan, UIColor.yellow],
        loaderInnerViewWidth: 2,
        loaderWidth: 3,
        storyViewedIndicatorColor: UIColor.gray,
        storyViewedIndicatorAlpha: 0.8,
        thumbViewOverlayColor: UIColor(hex8: 0x4C4C4CBB),
        playerBackgroundColor: .black.withAlphaComponent(0.3),
        playerVerticalAnchor: .center,
        playerShowShareButton: true,
        playerClosingButton: false,
        playerHorizontalMargins:10,
        playerCornerRadius:0,
        playerProgressBarDefaultColor:"#FFFFFF",
        playerProgressBarFillColor:"#026EDA",
        playerProgressBarThickness:4,
        playerProgressBarRadius:8
    )
    
    @objc func willEnterForeground() {
        // We re-load stories when the app re-open
        firstThumbView.startThumbView(config: secondConfig)
        secondThumbView.startThumbView(config: config)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = stackViewSpacing
        
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        stackView.addArrangedSubview(firstThumbView.view)
        stackView.addArrangedSubview(secondThumbView.view)
        
        firstThumbView.view.translatesAutoresizingMaskIntoConstraints = false
        firstThumbView.view.heightAnchor.constraint(equalToConstant: thumbViewHeight).isActive = true
        firstThumbView.view.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true

        secondThumbView.view.translatesAutoresizingMaskIntoConstraints = false
        secondThumbView.view.heightAnchor.constraint(equalToConstant: thumbViewHeight).isActive = true
        secondThumbView.view.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true

        firstThumbView.startThumbView(config: config)
        
        secondThumbView.activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            self.secondThumbView.startThumbView(config: secondConfig, onSuccess: {
                self.secondThumbView.activityIndicator.stopAnimating()
            })
        }
    }
    
}