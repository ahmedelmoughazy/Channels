//
//  HomeAdaptor.swift
//  Channels
//
//  Created by Ahmed Refaat on 4/16/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class HomeAdaptor: NSObject {
    
    var dataSource: UICollectionViewDiffableDataSource<SectionType, AnyHashable>?
    var collectionView: UICollectionView
    var list = [SectionType]()
    
    init(with collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func configure() {
        collectionView.backgroundColor = Asset.Colors.sharkColor.color
        collectionView.showsVerticalScrollIndicator = false
        collectionView.collectionViewLayout = configureLayout()
        collectionView.delegate = self
        collectionView.register(WideCollectionViewCell.nib,
                                forCellWithReuseIdentifier: WideCollectionViewCell.identifier)
        collectionView.register(CategoryCollectionViewCell.nib,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(SmallCollectionViewCell.nib,
                                forCellWithReuseIdentifier: SmallCollectionViewCell.identifier)
        collectionView.register(HeaderView.nibName,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.register(FooterView.nibName,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: FooterView.reuseIdentifier)
        configureDataSource()
        configureSupplementaryView()
    }
    
    func add(items: [SectionType]) {
        
        list.append(contentsOf: items)
        
        let payloadDatasource = DataSource(sections: items)
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, AnyHashable>()
        payloadDatasource.sections.forEach {
            snapshot.appendSections([$0])
            snapshot.appendItems($0.sectionItems)
        }
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    func update(item: SectionType) {
        
    }
    
    func add(item: SectionType) {
        
    }
    
    func count() -> Int {
        return list.count
    }
    
    func clear() {
    }
    
    func remove(_ item: AnyHashable, animate: Bool = true) {
        var snapshot = dataSource?.snapshot()
        snapshot?.deleteItems([item])
        guard let dataSourceSnapShot = snapshot else { return }
        dataSource?.apply(dataSourceSnapShot, animatingDifferences: animate)
    }
    
    func removeCellsAt(at indexPaths: [IndexPath]) {
        
    }
    
    func getSectionType(at index: Int) -> AnyHashable {
        list[index].headerItem
    }
}

// MARK: UICollectionViewDataSource

extension HomeAdaptor {
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, AnyHashable>(collectionView:
        collectionView) { (collectionView, indexPath, item) -> UICollectionViewCell? in
            
            let sectionType = self.getSectionType(at: indexPath.section)
            
            if let channel = sectionType as? Channel, channel.title == "Mindvalley Films" {
                guard let media = item as? Media, let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: WideCollectionViewCell.identifier,
                    for: indexPath) as? WideCollectionViewCell else { return UICollectionViewCell() }
                cell.configure(with: media)
                return cell
            }
            
            if let media = item as? Media {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: SmallCollectionViewCell.identifier,
                    for: indexPath) as? SmallCollectionViewCell else { return UICollectionViewCell() }
                cell.configure(with: media)
                return cell
            }
            
            if let categorey = item as? Categorey {
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: CategoryCollectionViewCell.identifier,
                    for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
                cell.configure(with: categorey)
                return cell
            }
            
            return nil
        }
    }
    
    func configureSupplementaryView() {
        dataSource?.supplementaryViewProvider = { (collectionView: UICollectionView,
            kind: String,
            indexPath: IndexPath) -> UICollectionReusableView? in
            
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: HeaderView.reuseIdentifier,
                    for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                headerView.configureHeader(sectionType: self.getSectionType(at: indexPath.section))
                return headerView
            default:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: FooterView.reuseIdentifier,
                    for: indexPath) as? FooterView else { return UICollectionReusableView() }
                
                return footerView
            }
        }
    }
}

// MARK: UICollectionViewLayout

extension HomeAdaptor {
    
    func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            
            let sectionType = self.getSectionType(at: sectionIndex)
            
            if sectionType is EpisodeSection {
                return self.getTightCellSectionLayout()
            }
            
            if let channel = sectionType as? Channel {
                if channel.latestMedia?[0].type == "video" {
                    return self.getWideCellSectionLayout()
                } else {
                    return self.getTightCellSectionLayout()
                }
            }
            
            if sectionType is CategoreySection {
                return self.getCategoriesSectionLayout()
            }
            
            return nil
        }
        
        return layout
    }
    
    func getWideCellSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(350),
            heightDimension: .absolute(240))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.orthogonalScrollingBehavior = .continuous
        sectionLayout.interGroupSpacing = 0
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(78))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(9))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        
        sectionLayout.boundarySupplementaryItems = [sectionHeader, sectionFooter]
        
        return sectionLayout
    }
    
    func getTightCellSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(190),
            heightDimension: .absolute(320))
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.orthogonalScrollingBehavior = .continuous
        sectionLayout.interGroupSpacing = 0
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 40)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(78))
        
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(9))
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        
        sectionLayout.boundarySupplementaryItems = [headerSupplementary, sectionFooter]
        return sectionLayout
    }
    
    func getCategoriesSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(75))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(20)
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.interGroupSpacing = 20
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(78))
        let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        sectionLayout.boundarySupplementaryItems = [headerSupplementary]
        
        return sectionLayout
    }
}
