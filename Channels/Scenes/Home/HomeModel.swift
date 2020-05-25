//
//  HomeModel.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import PromiseKit
import Moya

class HomeModel: BaseModel, HomeModelProtocol {
    
    func getChannels() -> Promise<[Channel]> {
        return Promise { seal in
            NetworkManager.shared.callApi(target: ApiServices.channels) { result, _ in
                switch result {
                case .success(let response):
                    do {
                        let result = try JSONDecoder().decode(APIResponse<ResponseData>.self, from: response)
                        guard let channels = result.data?.channels else { seal.fulfill([Channel]()); return }
                        seal.fulfill(channels)
                    } catch {
                        print(error)
                        seal.reject(NetworkError.parseError)
                    }
                case .failure(let error):
                    print(error)
                    seal.reject(error)
                }
            }
        }
    }
    
    func getEpisodes() -> Promise<[Media]> {
        return Promise { seal in
            NetworkManager.shared.callApi(target: ApiServices.episodes) { result, _ in
                switch result {
                case .success(let response):
                    do {
                        let result = try JSONDecoder().decode(APIResponse<ResponseData>.self, from: response)
                        guard let media = result.data?.media else { seal.fulfill([Media]()); return }
                        seal.fulfill(media)
                    } catch {
                        print(error)
                        seal.reject(NetworkError.parseError)
                    }
                case .failure(let error):
                    print(error)
                    seal.reject(error)
                }
            }
        }
    }
    
    func getCategories() -> Promise<[Categorey]> {
        return Promise { seal in
            NetworkManager.shared.callApi(target: ApiServices.categories) { result, _ in
                switch result {
                case .success(let response):
                    do {
                        let result = try JSONDecoder().decode(APIResponse<ResponseData>.self, from: response)
                        guard let categories = result.data?.categories else { seal.fulfill([Categorey]()); return }
                        seal.fulfill(categories)
                    } catch {
                        print(error)
                        seal.reject(NetworkError.parseError)
                    }
                case .failure(let error):
                    print(error)
                    seal.reject(error)
                }
            }
        }
    }
}
