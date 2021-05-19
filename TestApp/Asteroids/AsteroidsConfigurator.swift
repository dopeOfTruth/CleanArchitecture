//
//  AsteroidsConfigurator.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

class AsteroidsConfigurator {
    
    static let shared = AsteroidsConfigurator()
    
    func configure(view: AsteroidsViewController) {
        
        let viewController = view
        let interactor = AsteroidsInteractor()
        let presenter = AsteroidsPresenter()
        let router = AsteroidsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
    }
}
