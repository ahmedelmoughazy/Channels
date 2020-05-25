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
    
    let tokenClosure: (AuthorizationType) -> String = { _ in
        guard let token = UserDefaults.standard.string(forKey: "token") else { return "" }
        return token
    }
    
    static var shared: NetworkManager!
    var networkConfig: NetworkDefaults!

    let provider: MoyaProvider<MultiTarget>
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config

        let authPlugin = AccessTokenPlugin(tokenClosure: tokenClosure)

        let headerPlugin = StaticHeaderPlugin(
            headers: [:])
        let config = NetworkLoggerPlugin.Configuration(
            logOptions: NetworkLoggerPlugin.Configuration.LogOptions.verbose)
        provider = MoyaProvider<MultiTarget>(plugins: [headerPlugin,
                                                       authPlugin,
                                                       NetworkLoggerPlugin(configuration: config)])
    }
    
}
