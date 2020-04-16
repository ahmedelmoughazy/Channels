//
//  ResponseData.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct ResponseData: Codable {
    
    let channels: [Channel]?
    let media: [Media]?
    let categories: [Categorey]?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        channels = try values.decodeIfPresent([Channel].self, forKey: .channels)
        media = try values.decodeIfPresent([Media].self, forKey: .media)
        categories = try values.decodeIfPresent([Categorey].self, forKey: .categories)
    }
    
}
