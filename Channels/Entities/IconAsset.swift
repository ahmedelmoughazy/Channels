//
//  IconAsset.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct IconAsset: Codable {
	
    let thumbnailUrl: String?

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
	}
}
