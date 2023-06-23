import JoinStoriesSDK
import SwiftUI

struct ContentView: View {
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
    
    let playerConfig = JoinStoriesStandaloneConfig(
        alias: "widget-sdk-test-standalone",
        requestTimeoutInterval: 15,
        playerBackgroundColor: .black.withAlphaComponent(0.3),
        playerStandaloneAnimationOrigin: .default,
        playerVerticalAnchor: .topWithSafeArea,
        playerShowShareButton: false,
        playerClosingButton: true,
        playerCornerRadius: 30,
        playerProgressBarDefaultColor: "#FFFFFF",
        playerProgressBarFillColor: "#026EDA",
        playerProgressBarThickness: 4,
        playerProgressBarRadius: 8
    )
    
    let secondConfig = JoinStoriesThumbConfig(
        alias: "widget-test-sdk",
        requestTimeoutInterval: 15,
        containerDimension: 150,
        labelColor: UIColor.magenta,
        thumbViewSpacing: 32,
        loaderInnerViewColor : [UIColor.blue],
        loaderColors : [UIColor.yellow, UIColor.red],
        loaderInnerViewWidth: 2,
        loaderWidth: 3,
        storyViewedIndicatorColor: UIColor.brown,
        storyViewedIndicatorAlpha: 0.8,
        thumbViewOverlayColor: UIColor(hex8: 0x4C4FFCBB),
        playerBackgroundColor: .black.withAlphaComponent(0.3),
        playerVerticalAnchor: .center,
        playerShowShareButton: false,
        playerClosingButton: false,
        playerHorizontalMargins:10,
        playerCornerRadius:10,
        playerProgressBarDefaultColor:"#FFFF00",
        playerProgressBarFillColor:"#0FFEDA",
        playerProgressBarThickness:4,
        playerProgressBarRadius:8
    )
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                JoinStories.shared.startPlayer(config: playerConfig, completion: { _ in
                    
                })
            }) {
                Text("Start Player")
                    .foregroundColor(Color.white)
            }
            .frame(width: 150, height: 30)
            .background(Color(uiColor: UIColor(hex8: 0x5C69FFFF)))
            .cornerRadius(10)

            ThumbViewController(config: config)
                .frame(height: 150)
                .padding()
            
            ThumbViewController(config: secondConfig)
                .frame(height: 150)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor(hex8: 0x141414FF)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
