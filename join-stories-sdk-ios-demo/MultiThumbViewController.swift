import JOINStoriesSDK
import UIKit

class MultiThumbViewController: UIViewController {
    
    private var stackView: UIStackView!
    private let stackViewSpacing: CGFloat = 8
    private let thumbViewHeight: CGFloat = 150
    private var contentViewHeight: CGFloat {
        stackViewSpacing + (thumbViewHeight * 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = JoinStoriesBubbleConfigurations(
            labelFont: UIFont.jsAvenir(type: .avenirBlack, size: 12),
            labelColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
            loaderColors: [UIColor(red: 84/255, green: 157/255, blue: 247/255, alpha: 1).cgColor, UIColor(red: 84/255, green: 157/255, blue: 247/255, alpha: 1).cgColor],
            loaderWidth: 4
        )
        
        let firstThumbView = BubbleTriggerView(config, alias: "widget-6play-all")
        let cardView = TriggerCardView(TriggerCardConfigurationValues(), alias: "widget-demo-westfield")
        //let listView = TriggerListView(TriggerListConfigurationValues(), alias: "widget-6play-all")
        
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
        
        stackView.addArrangedSubview(firstThumbView)
        //stackView.addArrangedSubview(listView)
        
        firstThumbView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstThumbView.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 10),
            firstThumbView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 0),
            firstThumbView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -0),
            firstThumbView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 0),
        ])
        
        /*listView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 10),
            listView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 0),
            listView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 0),
            listView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
        ])*/

    }
    
}

