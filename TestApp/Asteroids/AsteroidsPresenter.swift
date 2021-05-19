//
//  AsteroidsPresenter.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

protocol AsteroidsPresentationLogic: AnyObject {
    func presentAsteroids(response: Asteroids.FetchData.Response)
}

class AsteroidsPresenter: AsteroidsPresentationLogic {
    
    var worker: AsteroidsWorker?
    weak var viewController: AsteroidsDisplayLogic?
    
    func presentAsteroids(response: Asteroids.FetchData.Response) {
        
        worker = AsteroidsWorker()
        
        guard let displayedAsteroids =  worker?.getDisplayedAsteroids(from: response.asteroids) else { return }
        
        let viewModel = Asteroids.FetchData.ViewModel(objects: displayedAsteroids)
        
        viewController?.displayAsteroids(viewModel: viewModel)
    }
}
