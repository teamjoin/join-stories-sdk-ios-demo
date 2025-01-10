//
//  HomeView.swift
//  join-stories-sdk-ios-demo
//
//  Created by Maxime Lignereux on 10/01/2025.
//

import JOINStoriesSDK
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                BubbleTrigger(alias: "welcome-showcase")
                    .frame(height: 150)
                
                BubbleTrigger(alias: "welcome-showcase")
                    .frame(height: 150)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: UIColor(hex: "#141414FF")!))
        }
    }
}
