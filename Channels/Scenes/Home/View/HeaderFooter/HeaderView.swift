//
//  HeaderView.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderView: UICollectionReusableView {
    
    @IBOutlet private weak var iconImageViewWidth: NSLayoutConstraint!
    @IBOutlet private weak var sectionImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        sectionImageView.layer.cornerRadius = sectionImageView.frame.height / 2
        titleLabel.font = FontFamily.Gilroy.extraBold.font(size: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.font = FontFamily.Roboto.medium.font(size: 14)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.textColor = Asset.Colors.manateeColor.color
    }
    
    func configureHeader(sectionType: AnyHashable) {
        if let header = sectionType as? EpisodeSection {
            sectionImageView.image = nil
            iconImageViewWidth.constant = 0
            titleLabel.text = header.sectionTitle
            titleLabel.textColor = Asset.Colors.silverColor.color
            subtitleLabel.text = nil
        }
        
        if let header = sectionType as? Channel {
            iconImageViewWidth.constant = 45
            sectionImageView.sd_setImage(with: URL(string: header.iconAsset?.thumbnailUrl ?? ""),
                                         placeholderImage: Asset.Images.iconPlaceHolder.image)
            titleLabel.text = header.title
            titleLabel.textColor = UIColor.white
            subtitleLabel.text = String(describing: header.mediaCount ?? 0) + " episodes"
        }
        
        if let header = sectionType as? CategoreySection {
            iconImageViewWidth.constant = 0
            titleLabel.text = header.sectionTitle
            titleLabel.textColor = Asset.Colors.manateeColor.color
            subtitleLabel.text = nil
        }
    }
}
