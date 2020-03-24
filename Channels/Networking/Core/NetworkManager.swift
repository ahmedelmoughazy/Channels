//
//  NetworkManager.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import Moya
import Alamofire
typealias StatusCode = Int

class NetworkManager {
    
    static var shared: NetworkManager!
    var networkConfig: NetworkDefaults!

    let provider: MoyaProvider<MultiTarget>
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config
        
        let headerPlugin = StaticHeaderPlugin(
            headers: [:])
        let config = NetworkLoggerPlugin.Configuration(
            logOptions: NetworkLoggerPlugin.Configuration.LogOptions.verbose)
        provider = MoyaProvider<MultiTarget>(//manager: ,
            plugins: [headerPlugin, NetworkLoggerPlugin(configuration: config)])
    }
    
}
