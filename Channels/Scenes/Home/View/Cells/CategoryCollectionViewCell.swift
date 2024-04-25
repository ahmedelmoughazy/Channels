//
//  CategoryCollectionViewCell.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/15/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

}

extension CategoryCollectionViewCell {
    func configure() {

        self.backgroundColor = Asset.Colors.tunaColor.color
        self.layer.cornerRadius = self.frame.height / 2
        titleLabel.font = FontFamily.Gilroy.extraBold.font(size: 18)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = UIColor.white
    }
    
    func configure(with categorey: Categorey) {
        titleLabel.text = categorey.name
    }
}
