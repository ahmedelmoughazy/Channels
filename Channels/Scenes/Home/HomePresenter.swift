//
//  HomePresenter.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol
    var model: HomeModelProtocol
    
    init(model: HomeModelProtocol, view: HomeViewProtocol) {
        self.view = view
        self.model = model
    }
    
    func getData() {
        
        var sections: [SectionType] = []
        
        sections.append(Section(headerItem: EpisodeSection(media: model.getEpisodes()),
                                sectionItems: model.getEpisodes()))
        let channels = model.getChannels()
        for channel in channels {
            sections.append(Section(headerItem: channel, sectionItems: channel.latestMedia ?? [Media]()))
        }
        
        sections.append(Section(headerItem: CategoreySection(categories: model.getCategories()),
                                sectionItems: model.getCategories()))
        view.renderView(with: sections)
    }

}
