import UIKit
import JOINStoriesSDK

/// PlayerOnlyViewController can launch StoryPlayer without using thumbViews
/// You will need top on button
class PlayerOnlyViewController: UIViewController {
    
    private let buttonHeight: CGFloat = 44
    
    let playerConfiguration: JoinStoriesPlayerConfigurations = JoinStoriesPlayerConfigurations()
    private var playerView: JoinStoriesPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#141414FF")
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        let launchPlayerButton = UIButton(type: .custom)
        launchPlayerButton.setTitle("Lancer le player", for: [])
        launchPlayerButton.setTitleColor(.white, for: .normal)
        launchPlayerButton.backgroundColor = UIColor(hex: "#5C69FFFF")
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
        
        self.playerView = JoinStoriesPlayer(alias: "welcome-showcase")
        
    }
    
    @objc private func launchPlayer(sender: UIButton!) {
        self.playerView.show()
    }
    
}
