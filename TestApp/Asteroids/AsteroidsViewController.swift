//
//  AsteroidsViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

protocol AsteroidsDisplayLogic: AnyObject {
    
    func displayAsteroids(viewModel: Asteroids.FetchData.ViewModel)
}

class AsteroidsViewController: UIViewController, AsteroidsDisplayLogic {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        ai.color = .white
        ai.center = view.center
        view.addSubview(ai)
        return ai
    }()
    
    var interactor: AsteroidsBusinessLogic?
    var router: (NSObjectProtocol & AsteroidsDataPassing & AsteroidsRouterProtocol)?
    
    var asteroidsTableView = UITableView()
    
    typealias Asteroid = Asteroids.FetchData.ViewModel.Object
    
    var asteroids: [Asteroid] = []
    
    var moreButtonIsTapped = false
    
    enum Section: Int, CaseIterable {
        case asteroids
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Asteroid>!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        AsteroidsConfigurator.shared.configure(view: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        AsteroidsConfigurator.shared.configure(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = Asteroids.FetchData.Request()
        interactor?.fetchAsteroids(request: request)
        
        setupCollectionView()
        createDataSource()
        
        activityIndicator.startAnimating()
    }
    
    
    func displayAsteroids(viewModel: Asteroids.FetchData.ViewModel) {
        
        asteroids = viewModel.objects
        DispatchQueue.main.async {
            self.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
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

        var snapShot = NSDiffableDataSourceSnapshot<Section, Asteroid>()
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
        
        dataSource = UICollectionViewDiffableDataSource<Section, Asteroid>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, asteroid) -> UICollectionViewCell? in
            
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let asteroid = dataSource.itemIdentifier(for: indexPath) else { return }
        let url = asteroid.url
        let request = Asteroids.SendURL.Request(url: url)
        interactor?.sendAsteroidURL(request: request)
        router?.routeToAsteroidDetailVC(segue: nil)
    }
}
