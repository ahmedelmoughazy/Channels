//
//  ApplicationCoordinator.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    private var window: UIWindow?
    private var navVC: UINavigationController
    private var appRouter: AppRouter
    private var homeCoordinator: HomeCoordinator?
    
    init(appWindow: UIWindow?) {
        window = appWindow
        navVC = UINavigationController()
        appRouter = AppRouter(navigationController: navVC)
        self.navVC.navigationBar.isHidden = true
    }
    
    func start() {
        startHome()
        window?.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator {

    func startHome() {
        self.homeCoordinator = HomeCoordinator(appRouter: appRouter)
        homeCoordinator?.start()
        window?.rootViewController = appRouter.toPresentable()
    }
}
