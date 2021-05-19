//
//  AsteroidRouter.swift
//  TestApp
//
//  Created by Михаил Красильник on 19.05.2021.
//

import UIKit

@objc protocol AsteroidsRouterProtocol {
    func routeToAsteroidDetailVC(segue: UIStoryboardSegue?)
}

protocol AsteroidsDataPassing {
    var dataStore: AsteroidsDataStore? { get }
}

class AsteroidsRouter: NSObject, AsteroidsDataPassing, AsteroidsRouterProtocol {
    
    weak var viewController: AsteroidsViewController?
    var dataStore: AsteroidsDataStore?
    
    func routeToAsteroidDetailVC(segue: UIStoryboardSegue?) {
        
        if let segue = segue {
            guard let asteroidsDS = dataStore,
                  let asteroidDetailVC = segue.destination as? AsteroidDetailVC,
                  var asteroidDetailDS = asteroidDetailVC.router?.dataStore
            else { return }
            passDataToDetailVC(source: asteroidsDS, destination: &asteroidDetailDS)
        } else {
            guard let viewController = viewController,
                  let dataStore = dataStore,
                  let url = dataStore.asteroidURL
            else { return }
            let asteroidDetailVC = AsteroidDetailVC(urlString: url)
            navigationToDetailVC(source: viewController, destination: asteroidDetailVC)
        }
    }
    
    private func passDataToDetailVC(source: AsteroidsDataStore, destination: inout AsteroidDetailDataStore) {
        
    }
    
    private func navigationToDetailVC(source: AsteroidsViewController, destination: AsteroidDetailVC) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
