//
//  AsteroidsInteractor.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

protocol AsteroidsBusinessLogic: AnyObject {
    func fetchAsteroids(request: Asteroids.FetchData.Request)
    func sendAsteroidURL(request: Asteroids.SendURL.Request)
}

protocol AsteroidsDataStore {
    var asteroids: [NearEarthObject] { get }
    var asteroidURL: String? { get }
    
}

class AsteroidsInteractor: AsteroidsBusinessLogic, AsteroidsDataStore {
    
    var asteroidURL: String?
    
    var asteroids: [NearEarthObject] = []
    
    var presenter: AsteroidsPresentationLogic?
    
    func sendAsteroidURL(request: Asteroids.SendURL.Request) {
        asteroidURL = request.url
    }
    
    func fetchAsteroids(request: Asteroids.FetchData.Request) {
        
        NetworkDataFeatcher.shared.getAsteroids { asteroids in
            self.asteroids = asteroids
            let response = Asteroids.FetchData.Response(asteroids: asteroids)
            self.presenter?.presentAsteroids(response: response)
        }
    }
}
