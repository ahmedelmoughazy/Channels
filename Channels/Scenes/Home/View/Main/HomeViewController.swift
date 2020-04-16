//
//  HomeViewController.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter> {
    
    @IBOutlet private weak var channelsCollectionView: UICollectionView!
    
    var adaptor: HomeAdaptor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.getData()
    }
    
    func setupView() {
        self.view.backgroundColor = Asset.Colors.sharkColor.color
        self.setupNavigationbar()
        self.configureCollectionView()
    }
    
    func setupNavigationbar() {
        self.navigationItem.title = L10n.Home.Screen.title
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar
            .largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: Asset.Colors.silverColor.color]
        self.navigationController?.navigationBar
            .titleTextAttributes = [NSAttributedString.Key.foregroundColor: Asset.Colors.silverColor.color]
    }
    
    func configureCollectionView() {
        adaptor = HomeAdaptor(with: channelsCollectionView)
        adaptor?.configure()
    }
}

extension HomeViewController: HomeViewProtocol {
    func renderView(with data: [SectionType]) {
        adaptor?.add(items: data)
    }
}
