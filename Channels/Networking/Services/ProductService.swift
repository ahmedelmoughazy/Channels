//
//  ProductService.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import Moya

enum  ApiServices {

}

extension ApiServices: TargetType {
    //swiftlint:disable  force_unwrapping
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: [:], encoding: URLEncoding.default)
    }
    
    var headers: [String: String]? {
        return nil
    }
}

extension ApiServices: MoyaCacheable {
    var cachePolicy: MoyaCacheablePolicy {
        return .reloadIgnoringCacheData
    }
}
