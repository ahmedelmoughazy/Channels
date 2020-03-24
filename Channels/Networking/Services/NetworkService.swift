//
//  NetworkService.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func callApi(target: TargetType, completion: @escaping (
        _ result: Swift.Result<Data, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    completion(.success(response.data), response.statusCode)
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(APIResponse<String>.self,
                                                                     from: response.data).error
                        print(response.data)
                        businessError?.type = .business
                        completion(.failure(businessError ?? NetworkError.parseError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
    }
}
