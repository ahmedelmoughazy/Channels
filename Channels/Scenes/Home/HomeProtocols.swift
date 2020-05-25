//
//  HomeProtocols.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import PromiseKit

protocol HomePresenterProtocol: BasePresenterProtocol {
}

protocol HomeViewProtocol: BaseViewProtocol {
    func renderView(with data: [SectionType])
}

protocol HomeModelProtocol: BaseModelProtocol {
    func getChannels() -> Promise<[Channel]>
    func getEpisodes() -> Promise<[Media]>
    func getCategories() -> Promise<[Categorey]>
}
