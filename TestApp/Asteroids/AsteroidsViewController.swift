//
//  AsteroidsViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

class AsteroidsViewController: UIViewController {
    
    var asteroidsTableView = UITableView()
    
    var asteroids: [NearEarthObject] = []
    
    var cellHeight: CGFloat = 0.2
    var moreButtonIsTapped = false
    
    enum Section: Int, CaseIterable {
        case asteroids
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, NearEarthObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkDataFeatcher.shared.getAsteroids { asteroids in
            self.asteroids = asteroids
            self.reloadData()
            
            
        }
        
        setupCollectionView()
        createDataSource()

    }
    
    private func setupCollectionView() {
        
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainBackground()
        
        view.addSubview(collectionView)
        
        collectionView.register(AsteroidCell.self, forCellWithReuseIdentifier: AsteroidCell.reuseId)
        collectionView.delegate = self
    }
    
    private func reloadData() {

        var snapShot = NSDiffableDataSourceSnapshot<Section, NearEarthObject>()
        snapShot.appendSections([.asteroids])
        snapShot.appendItems(asteroids, toSection: .asteroids)
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
}

// MARK: - Setup layout
extension AsteroidsViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            guard let section = Section.init(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .asteroids:
                return self.createAsteroidsSection()
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        
        return layout
    }
    
    
    private func createAsteroidsSection() -> NSCollectionLayoutSection {
        
        let spacing = CGFloat(30)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: 0, trailing: spacing)
        
        return section
    }
    
}

//MARK: - createDataSource
extension AsteroidsViewController {
    
    private func createDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource<Section, NearEarthObject>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, user) -> UICollectionViewCell? in
            
            guard let section = Section.init(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .asteroids:
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AsteroidCell.reuseId, for: indexPath) as! AsteroidCell
                
                let asteroid = self.asteroids[indexPath.row]
                
                cell.backgroundColor = .backgroundForElements()
                cell.configure(with: asteroid)
                
                return cell
            }
        })
    }
}

extension AsteroidsViewController: UICollectionViewDelegate {

    
}
