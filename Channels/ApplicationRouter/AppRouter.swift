//
//  AppRouter.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class AppRouter: NSObject, Router {
    
    private var completions: [UIViewController : () -> Void]
    
    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }
    
    public unowned let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        //self.navigationController.delegate = self
    }
    
    public func toPresentable() -> UIViewController {
        return navigationController
    }
    
    public func present(_ module: Showable, animated: Bool) {
        
        navigationController.present(module.toShowable(), animated: animated, completion: nil)
        
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        
        navigationController.dismiss(animated: animated, completion: completion)
        
    }
    
    public func push(_ module: Showable, animated: Bool = true, completion: (() -> Void)? = nil) {
        // Avoid pushing UINavigationController onto stack
        let controller = module.toShowable()
        
        // Avoid pushing UINavigationController onto stack
        guard controller is UINavigationController == false else {
            return
        }
        
        if let completion = completion {
            completions[controller] = completion
        }
        navigationController.pushViewController(controller, animated: animated)
    }
    
    public func pop(animated: Bool = true) {
        
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }
    
    fileprivate func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else {
            return
        }
        completion()
        completions.removeValue(forKey: controller)
    }
}

extension AppRouter: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        
        //Make sure the view controller is popping, not pushing, and check for existence
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(
            forKey: .from), !navigationController.viewControllers.contains(poppedViewController)
            
            else { return }
        
        //as long as the closure is properly setup, it can now be used to clean up any resources
        runCompletion(for: poppedViewController)
    }
    
}
