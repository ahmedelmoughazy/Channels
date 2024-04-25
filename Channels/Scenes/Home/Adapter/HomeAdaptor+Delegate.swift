//
//  HomeAdaptor+Delegate.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/16/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

extension HomeAdaptor: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = list[indexPath.section].sectionItems[indexPath.row] as? Media {
            print(item.title ?? "no title")
        }
        
        if let item = list[indexPath.section].sectionItems[indexPath.row] as? Categorey {
            print(item.name ?? "no title")
        }
    }
}
