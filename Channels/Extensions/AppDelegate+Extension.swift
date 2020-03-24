//
//  AppDelegate+Extension.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    func intialNetworking() {
        NetworkManager.shared = NetworkManager(config: NetworkDefaults())
    }
}
