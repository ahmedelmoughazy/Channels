//
//  SctionModel.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/15/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

struct Section<T: Hashable, U: Hashable>: Hashable {
    let headerItem: T
    let sectionItems: U
}

struct DataSource<T: Hashable> {
    let sections: [T]
}

class EpisodeSection: Hashable {
    
    var sectionTitle: String = L10n.Home.Screen.Sections.episodes
    
    var media: [Media]?
    
    init(media: [Media]) {
        self.media = media
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: EpisodeSection, rhs: EpisodeSection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}

class CategoreySection: Hashable {
    
    var sectionTitle: String = L10n.Home.Screen.Sections.categories
    
    var categories: [Categorey]?
    
    init(categories: [Categorey]) {
        self.categories = categories
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: CategoreySection, rhs: CategoreySection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
