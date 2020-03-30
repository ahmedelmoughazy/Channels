//
//  BaseViewController.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {
    
    var presenter: Presenter!
    
    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }
    
    func showLoading(allowNavigation: Bool) {
        
    }
        
    func hideLoading() {
        
    }
    
    func showErrorMassege(errorMessage: String) {
        
    }
}
