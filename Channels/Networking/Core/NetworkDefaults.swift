//
//  NetworkDefaults.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String = "https://pastebin.com"
    var apiKey: String = ""
    var language: String = "en-US"
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
