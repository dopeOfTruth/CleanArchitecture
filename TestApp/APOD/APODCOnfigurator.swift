//
//  APODConfigurator.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

class APODConfigurator {
    
    static let shared = APODConfigurator()
    
    func configure(view: APODViewController) {
        
        let viewController = view
        let interactor = APODInteractor()
        let presenter = APODPresenter()
        let router = APODRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
    }
}
