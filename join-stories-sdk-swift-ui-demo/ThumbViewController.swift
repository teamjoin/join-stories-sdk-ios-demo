import JoinStoriesSDK
import SwiftUI

struct ThumbViewController: UIViewControllerRepresentable {
    
    let thumbViewController = BasicThumbViewController()
    var config: JoinStoriesThumbConfig!
    
    func makeUIViewController(context: Context) -> BasicThumbViewController {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        thumbViewController._collectionView.setCollectionViewLayout(layout, animated: true)
        return thumbViewController
    }
    
    func updateUIViewController(_ viewController: BasicThumbViewController, context: Context) {
        viewController.startThumbView(config: config, onSuccess: {
            print("success")
        }, onError: { error in
            print("error")
        })
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, JoinStoriesAnalyticsDelegate {
        
        init(_ parent: ThumbViewController) {
            super.init()
            
            parent.thumbViewController.analyticsDelegate = self
        }

        func onAnalyticsCallback(event: JoinStoriesEventType, data: AnalyticsWidgetValue) {
            switch event {
            case .storiesFetched:
                print("storiesFetched")
            case .widgetMounted:
                print("widgetMounted")
            case .componentVisible50:
                print("componentVisible50")
            case .componentVisible75:
                print("componentVisible75")
            case .firstClickOnWidget:
                print("firstClickOnWidget to url: \(data.cpGoToUrl)")
            case .additionalClickOnWidget:
                print("additionalClickOnWidget to url: \(data.cpGoToUrl)")
            }
        }
    }
}

