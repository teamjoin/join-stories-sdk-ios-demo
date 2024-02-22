import JOINStoriesSDK
import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                let playerView = JoinStoriesPlayer(alias: "widget-demo-m6")
                playerView.show()
                
            }) {
                Text("Start Player")
                    .foregroundColor(Color.white)
            }
            .frame(width: 150, height: 30)
            .background(Color(uiColor: UIColor(hex: "#5C69FFFF")!))
            .cornerRadius(10)

            BubbleTrigger(alias: "widget-6play-all")
            
            TriggerList(alias: "widget-6play-destination-x")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor(hex: "#141414FF")!))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
