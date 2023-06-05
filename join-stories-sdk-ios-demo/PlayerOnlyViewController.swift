import UIKit
import JoinStoriesSDK

/// PlayerOnlyViewController can launch StoryPlayer without using thumbViews
/// You will need top on button
class PlayerOnlyViewController: UIViewController {
    
    private let buttonHeight: CGFloat = 44
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        let launchPlayerButton = UIButton(type: .custom)
        launchPlayerButton.setTitle("Lancer le player", for: [])
        launchPlayerButton.setTitleColor(.white, for: .normal)
        launchPlayerButton.backgroundColor = .blue
        launchPlayerButton.layer.cornerRadius = 10
        launchPlayerButton.addTarget(self, action: #selector(launchPlayer), for: .touchUpInside)
        
        view.addSubview(launchPlayerButton)

        launchPlayerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            launchPlayerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            launchPlayerButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            launchPlayerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            launchPlayerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
    }
    
    @objc private func launchPlayer(sender: UIButton!) {
        let config = JoinStoriesStandaloneConfig(
            alias: "widget-sdk-test-standalone",
            requestTimeoutInterval: 15,
            playerBackgroundColor: .black.withAlphaComponent(0.3),
            playerStandaloneAnimationOrigin: .default,
            playerVerticalAnchor: .top(ignoresTopSafeArea: false),
            playerShowShareButton: true,
            playerCornerRadius:30,
            playerProgressBarDefaultColor:"#FFFFFF",
            playerProgressBarFillColor:"#026EDA",
            playerProgressBarThickness:4,
            playerProgressBarRadius:8
        )
        JoinStories.startPlayer(config: config, fromController: self) { [weak self] result in
            switch result {
            case .success:
                print("LaunchPlayer: Success")
            case .failure(let error):
                switch error {
                case .fetchingStoriesEmpty:
                    self?.presentAlert(title: "Erreur", message: "No story available for that configuration")
                default:
                    self?.showError(error)
                }
            }
        } onDismiss: { _ in
            print("Player Dismissed")
            self.presentAlert(title: "Player", message: "The player has been dismissed!")
        }
    }
    
}
