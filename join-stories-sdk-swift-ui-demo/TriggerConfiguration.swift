//
//  TriggerConfiguraiton.swift
//  Test App
//
//  Created by Maxime Lignereux on 18/12/2024.
//

import UIKit
import JOINStoriesSDK
import SwiftUI

final class TriggerConfiguration: ObservableObject {
    @Published var heightForTriggerCard: CGFloat = 0
    
    init() {
        JOINStoriesListener.setDelegate(delegate: self)
    }
    
}

extension TriggerConfiguration: JOINStoriesListenerDelegate {
    func gridTriggerDesiredContentHeight(gridTriggerHeight: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            guard let sSelf = self else { return }
            sSelf.heightForTriggerCard = gridTriggerHeight
        }
    }
}
