//
//  HomePresenter.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import PromiseKit

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol
    var model: HomeModelProtocol
    
    init(model: HomeModelProtocol, view: HomeViewProtocol) {
        self.view = view
        self.model = model
    }
    
    func getData() {
        
        var sections: [SectionType] = []
        
        let episodesPromise = model.getEpisodes()
        let channelsPromise = model.getChannels()
        let categoriesPromise = model.getCategories()
        
        firstly {
            when(fulfilled: episodesPromise, channelsPromise, categoriesPromise)
        }.done { episodes, channels, categories in
            sections.append(Section(headerItem: EpisodeSection(media: episodes), sectionItems: episodes))
            for channel in channels {
                sections.append(Section(headerItem: channel, sectionItems: channel.latestMedia ?? [Media]()))
            }
            sections.append(Section(headerItem: CategoreySection(categories: categories), sectionItems: categories))
            self.view.renderView(with: sections)
        }.catch { error in
            print(error)
        }
    }
}
