//
//  DashboardView.swift
//  join-stories-sdk-ios-demo
//
//  Created by Maxime Lignereux on 10/01/2025.
//

import JOINStoriesSDK
import SwiftUI

struct DashboardView: View {
    @StateObject var gridCardConfiguration: TriggerConfiguration = TriggerConfiguration()
    let triggerCardConfiguration = TriggerCardConfigurationValues()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    TriggerList(alias: "welcome-showcase")
                        .frame(height: 210)
                    
                    TriggerCard(triggerCardConfiguration, alias: "welcome-showcase")
                        .frame(height: 400)
                    
                    TriggerCard(
                        TriggerCardConfigurationValues(
                            labelColor: UIColor.red,
                            cardRadius: 0,
                            showPlayButton: false,
                            numberOfColumns: 3
                        ),
                        alias: "welcome-showcase"
                    )
                    .frame(height: 400)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(uiColor: UIColor(hex: "#141414FF")!))
            
        }
    }
}
