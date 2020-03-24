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
}
