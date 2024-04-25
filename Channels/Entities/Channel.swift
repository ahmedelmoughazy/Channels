//
//  Channel.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct Channel: Codable, Hashable {
 
	let title: String?
	let series: [Series]?
	let mediaCount: Int?
	let latestMedia: [Media]?
	let id: String?
	let iconAsset: IconAsset?
	let coverAsset: CoverAsset?

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		series = try values.decodeIfPresent([Series].self, forKey: .series)
		mediaCount = try values.decodeIfPresent(Int.self, forKey: .mediaCount)
		latestMedia = try values.decodeIfPresent([Media].self, forKey: .latestMedia)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		iconAsset = try values.decodeIfPresent(IconAsset.self, forKey: .iconAsset)
		coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
	}

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
