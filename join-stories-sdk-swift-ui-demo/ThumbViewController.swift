import JoinStoriesSDK
import SwiftUI

struct ThumbViewController: UIViewControllerRepresentable {
    
    var config: JoinStoriesThumbConfig!
    
    func makeUIViewController(context: Context) -> BasicThumbViewController {
        let thumbViewController = BasicThumbViewController()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        thumbViewController.collectionView.setCollectionViewLayout(layout, animated: true)
        return thumbViewController
    }
    
    func updateUIViewController(_ viewController: BasicThumbViewController, context: Context) {
        viewController.startThumbView(config: config, onSuccess: {
            print("success")
        }, onError: { error in
            print("error")
        })
    }
    
}
