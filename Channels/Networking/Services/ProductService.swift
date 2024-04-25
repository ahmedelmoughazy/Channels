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
    case episodes
    case channels
    case categories
}

extension ApiServices: TargetType {
    //swiftlint:disable  force_unwrapping
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .episodes:
            return "/raw/z5AExTtw"
        case .channels:
            return "/raw/Xt12uVhM"
        case .categories:
            return "/raw/A0CgArX3"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .episodes, .channels, .categories:
            return .get
        }

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

extension ApiServices: AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return nil
        }
    }
}
