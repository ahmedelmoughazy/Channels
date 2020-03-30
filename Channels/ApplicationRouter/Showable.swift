//
//  Showable.swift
//  Channels
//
//  Created by Ahmed Refaat on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

extension UIViewController: Showable {
    func toShowable() -> UIViewController {
        return self
    }
}
