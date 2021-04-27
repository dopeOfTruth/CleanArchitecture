//
//  NetworkDataFeatcher.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import Foundation

class NetworkDataFeatcher {
    
    static let shared = NetworkDataFeatcher()
    
    func getAsteroids(completion: @escaping ([NearEarthObject]) -> Void) {
        
        NetworkService.shared.performRequest(urlString: API.asteroids) { result in
            
            switch result {
            
            case .success(let data):
                
                let decoder = JSONDecoder()

                let someData = try? decoder.decode(AsteroidModel.self, from: data)
 
                if let someData = someData {
                    completion(someData.nearEarthObjects)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getAPOD(completion: @escaping (APODModel) -> Void) {
        
        NetworkService.shared.performRequest(urlString: API.apod) { result in
            
            switch result {
            
            case .success(let data):
                
                let decoder = JSONDecoder()
                
                let apod = try? decoder.decode(APODModel.self, from: data)
                
                if let apod = apod {
                    completion(apod)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
