//
//  Series.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/14/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct Series: Codable {
   
    let url: String?
    let title: String?
    let coverAsset: CoverAsset?

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
    }

}
