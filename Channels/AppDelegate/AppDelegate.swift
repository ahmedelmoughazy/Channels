//
//  AppDelegate.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        intialNetworking()
        
        if #available(iOS 13.0, *) {
            // done in scene delegete
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            let applicationCoordinator = ApplicationCoordinator(appWindow: window)
            self.applicationCoordinator = applicationCoordinator
            applicationCoordinator.start()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

}
