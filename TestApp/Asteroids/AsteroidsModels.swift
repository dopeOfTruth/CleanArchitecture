//
//  AsteroidsModels.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

enum Asteroids: Hashable {
    
    enum FetchData: Hashable {
        struct Request {
            
        }
        
        struct Response {
            let asteroids: [NearEarthObject]
        }
        
        struct ViewModel: Hashable {
            
            struct Object: Hashable {
                let asteroidName: String
                let date: String
                let relativeVelocity: String
                let diameter: String
                let url: String
            }

            var objects: [Object]
        }
    }
    
    enum SendURL: Hashable {
        struct Request {
            let url: String
        }
        
        struct Response {
            
        }
        
        struct ViewModel: Hashable {
            
        }
    }
}
