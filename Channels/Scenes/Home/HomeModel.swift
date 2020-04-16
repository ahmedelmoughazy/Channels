//
//  HomeModel.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

class HomeModel: BaseModel, HomeModelProtocol {
    
    func getChannels() -> [Channel] {
        if let path = Bundle.main.path(forResource: "Channels.Success", ofType: "json") {
            let decoder = JSONDecoder()
            do {
                guard let data = try? String(contentsOfFile: path).data(using: .utf8) else { return [Channel]() }
                let dataStored = try decoder.decode(APIResponse<ResponseData>.self, from: data)
                guard let channels = dataStored.data?.channels else { return [Channel]() }
                return channels
            } catch let error {
                print("parse error: \(error)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return [Channel]()
    }

    func getEpisodes() -> [Media] {
        if let path = Bundle.main.path(forResource: "Episodes.Success", ofType: "json") {
            let decoder = JSONDecoder()
            do {
                guard let data = try? String(contentsOfFile: path).data(using: .utf8) else { return [Media]() }
                let dataStored = try decoder.decode(APIResponse<ResponseData>.self, from: data)
                guard let media = dataStored.data?.media else { return [Media]() }
                return media
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return [Media]()
    }
    
    func getCategories() -> [Categorey] {
        if let path = Bundle.main.path(forResource: "Category.Success", ofType: "json") {
            let decoder = JSONDecoder()
            do {
                guard let data = try? String(contentsOfFile: path).data(using: .utf8) else { return [Categorey]() }
                let dataStored = try decoder.decode(APIResponse<ResponseData>.self, from: data)
                guard let categories = dataStored.data?.categories else { return [Categorey]() }
                return categories
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
        return [Categorey]()
    }
}
