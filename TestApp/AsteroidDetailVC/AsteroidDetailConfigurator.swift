//
//  AsteroidDetailConfigurator.swift
//  TestApp
//
//  Created by Михаил Красильник on 19.05.2021.
//

import Foundation

class AsteroidDetailConfigurator {
    
    static let shared = AsteroidDetailConfigurator()
    
    func configure(view: AsteroidDetailVC) {
        
        let viewController = view
        let interactor = AsteroidDetailInteractor()
        let presenter = AsteroidDetailPresenter()
        let router = AsteroidDetailRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
    }
}
