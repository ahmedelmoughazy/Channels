//
//  SplashScreen.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/31/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit
import SwiftSiriWaveformView

class SplashScreen: UIView {
    
    @IBOutlet private weak var diamondView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var timer: Timer?
    var change: CGFloat = 0.01
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func start() {
        //Total animation duration is 1.0 seconds - This time is inside the
        titleLabel.alpha = 0.0
        titleLabel.center.y = self.center.y + 60
        diamondView.center = self.center
        
        self.titleLabel.frame.origin.x = self.frame.size.width
        UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25, animations: {
                //1.Expansion + button label alpha
                self.diamondView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                //3.Grant momentum
                self.diamondView.transform = CGAffineTransform(rotationAngle: 90)
                self.titleLabel.center.x = self.center.x
                self.titleLabel.alpha = 1.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                //2.Shrink
                self.diamondView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                //4.Move out of screen and reduce alpha to 0
                self.diamondView.transform = CGAffineTransform(scaleX: 15, y: 15)
                self.titleLabel.transform = CGAffineTransform(scaleX: 15, y: 15)
                self.alpha = 0.0
            })
        }, completion: { _  in
            self.removeFromSuperview()
        })
    }
}
