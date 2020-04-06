//
//  HomeViewController.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter>, HomeViewProtocol {

    @IBOutlet private weak var homeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        homeLabel.pulsate()
    }
}
