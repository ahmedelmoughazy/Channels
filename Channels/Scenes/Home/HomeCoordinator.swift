//
//  HomeCoordinator.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private let appRouter: AppRouter
    private var homePresenter: HomePresenter?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }
    
    func createModule() -> HomeViewController {
        let view = HomeViewController()
        let model = HomeModel()
        let presenter = HomePresenter(model: model, view: view)
        homePresenter = presenter
        view.setPresenter(presenter: presenter)
        self.rootVC = view
        return view
    }
    
    func start() {
        let home = self.createModule()
        guard let rootViewController = rootVC else { return }
        appRouter.push(rootViewController, animated: true, completion: nil)
        self.rootVC = home
    }
}
