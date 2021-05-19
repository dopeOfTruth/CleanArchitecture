//
//  WelcomeRouter.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import UIKit

@objc protocol WelcomeRoutingLogic {
    func routeToAPOD(segue: UIStoryboardSegue?)
    func routeToAsteroids(segue: UIStoryboardSegue?)
}

protocol WelcomeDataPassing {
    var dataStore: WelcomeDataStore? { get }
}

class WelcomeRouter: NSObject, WelcomeDataPassing, WelcomeRoutingLogic {
    var dataStore: WelcomeDataStore?
    
    weak var viewController: WelcomeViewController?
    
    func routeToAPOD(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let welcomeDS = dataStore,
                  let apodVC = segue.destination as? APODViewController,
                  var apodDS = apodVC.router?.dataStore
            else { fatalError("Fail route to APOD") }

            passDataToAPOD(source: welcomeDS, destination: &apodDS)
        } else {
            guard let viewController = viewController else { return }
            let apodVC = APODViewController()
            navigationToAPOD(source: viewController, destination: apodVC)
            
        }
    }
    
    func routeToAsteroids(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let welcomeDS = dataStore,
                  let asteroidsVC = segue.destination as? AsteroidsViewController,
                  var asteroidsDS = asteroidsVC.router?.dataStore
            else { fatalError("Fail route to APOD") }

            passDataToAsteroids(source: welcomeDS, destination: &asteroidsDS)
        } else {
            guard let viewController = viewController else { return }
            let asteroidsVC = AsteroidsViewController()
            navigationToAsteroids(source: viewController, destination: asteroidsVC)
        }
    }
    
    
    func passDataToAPOD(source: WelcomeDataStore, destination: inout APODDataStore) {
        
    }
    
    private func navigationToAPOD(source: WelcomeViewController, destination: APODViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func passDataToAsteroids(source: WelcomeDataStore, destination: inout AsteroidsDataStore) {
        
    }
    
    private func navigationToAsteroids(source: WelcomeViewController, destination: AsteroidsViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
