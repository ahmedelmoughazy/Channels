//
//  Media.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct Media: Codable, Hashable {
	
    let type: String?
	let title: String?
	let coverAsset: CoverAsset?
	let channel: Channel?

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
		channel = try values.decodeIfPresent(Channel.self, forKey: .channel)
	}
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
