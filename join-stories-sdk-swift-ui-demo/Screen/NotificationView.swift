//
//  NotificationView.swift
//  join-stories-sdk-ios-demo
//
//  Created by Maxime Lignereux on 10/01/2025.
//

import JOINStoriesSDK
import SwiftUI

struct NotificationView: View {
    let playerView = JoinStoriesPlayer(alias: "welcome-showcase")
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Button(action: {
                    self.playerView.show()
                    
                }) {
                    Text("Start Player")
                        .foregroundColor(Color.white)
                }
                .frame(width: 150, height: 30)
                .background(Color(uiColor: UIColor(hex: "#5C69FFFF")!))
                .cornerRadius(10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: UIColor(hex: "#141414FF")!))
        }
    }
}
