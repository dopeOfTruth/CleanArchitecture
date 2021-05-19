//
//  WelcomeConfigurator.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

class WelcomeConfigurator {
    
    static let shared = WelcomeConfigurator()
    
    func configure(view: WelcomeViewController) {
        
        let viewController = view
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter()
        let router = WelcomeRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
    }
}
