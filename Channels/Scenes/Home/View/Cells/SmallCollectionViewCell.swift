//
//  TestCollectionViewCell.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/16/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var coverBackgroundView: UIImageView!
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
}

extension SmallCollectionViewCell {
    func configure() {
        
        titleLabel.font = FontFamily.Gilroy.extraBold.font(size: 18)
        titleLabel.textColor = UIColor.white
        titleLabel.lineBreakMode = .byWordWrapping
        categoryLabel.font = FontFamily.Roboto.medium.font(size: 14)
        categoryLabel.textColor = Asset.Colors.manateeColor.color
        
        setupView()
    }
    
    func setupView() {
        coverImageView.image = Asset.Images.posterPlaceHolder.image
        coverImageView.contentMode = .scaleAspectFill
        
        coverBackgroundView.image = Asset.Images.posterPlaceHolder.image
        coverBackgroundView.contentMode = .scaleAspectFill
        coverBackgroundView.layer.masksToBounds = true
        coverBackgroundView.layer.cornerRadius = 15
        coverBackgroundView.alpha = 0.4
        
        let maskLayer = CAGradientLayer()
        maskLayer.frame = self.bounds
        maskLayer.shadowRadius = 10
        maskLayer.shadowPath = CGPath(roundedRect: self.coverBackgroundView.bounds.insetBy(dx: 14, dy: 14),
                                      cornerWidth: 10,
                                      cornerHeight: 10,
                                      transform: nil)
        maskLayer.shadowOpacity = 1
        maskLayer.shadowOffset = CGSize.zero
        maskLayer.shadowColor = UIColor.black.cgColor
        coverBackgroundView.layer.mask = maskLayer
        
        let path = UIBezierPath(roundedRect: CGRect(x: 15,
                                                    y: 0,
                                                    width: self.coverBackgroundView.bounds.width - 30,
                                                    height: self.coverBackgroundView.frame.height),
                                cornerRadius: 12)
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.fillRule = .evenOdd
        fillLayer.opacity = 1.0
        coverImageView.layer.mask = (fillLayer)
    }
    
    func configure(with media: Media) {
        titleLabel.text = media.title
        categoryLabel.text = media.channel?.title
        
        if let url = media.coverAsset?.url {
            coverBackgroundView.kf.setImage(with: URL(string: url),
                                            placeholder: Asset.Images.posterPlaceHolder.image,
                                            options: nil,
                                            progressBlock: nil) { result in
                                                switch result {
                                                case .success(let value):
                                                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                                                case .failure(let error):
                                                    print("Job failed: \(error.localizedDescription)")
                                                }
            }
            coverImageView.kf.setImage(with: URL(string: url),
                                       placeholder: Asset.Images.posterPlaceHolder.image,
                                       options: nil,
                                       progressBlock: nil) { result in
                                        switch result {
                                        case .success(let value):
                                            print("Task done for: \(value.source.url?.absoluteString ?? "")")
                                        case .failure(let error):
                                            print("Job failed: \(error.localizedDescription)")
                                        }
            }
        }
        
    }
}
