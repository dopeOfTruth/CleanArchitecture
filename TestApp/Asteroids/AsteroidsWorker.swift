//
//  AsteroidsWorker.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation



class AsteroidsWorker {
    
    func getDisplayedAsteroids(from asteroids: [NearEarthObject]) -> [Asteroids.FetchData.ViewModel.Object] {
        
        var objects: [Asteroids.FetchData.ViewModel.Object] = []
        
        asteroids.forEach { asteroid in
            
            guard let date = asteroid.closeApproachData.first?.closeApproachDateFull else { return }
            guard let kilometersPerHour = asteroid.closeApproachData.first?.relativeVelocity.milesPerHour  else { return }
            guard let relativeVelocity = Double(kilometersPerHour)  else { return }
            let velocity = "Relative velocity: \(String(format: "%.2f", relativeVelocity)) km/h"
            let min = asteroid.estimatedDiameter.kilometers.estimatedDiameterMin
            let max = asteroid.estimatedDiameter.kilometers.estimatedDiameterMax
            let diameter = "Estimated Diametr km: from \(String(format:"%.2f", min)) to \(String(format:"%.2f", max))"
            let url = asteroid.nasaJplURL
            
            let object = Asteroids.FetchData.ViewModel.Object(
                    asteroidName: asteroid.nameLimited,
                    date: date,
                    relativeVelocity: velocity,
                    diameter: diameter,
                    url: url)
            
            objects.append(object)
        }
        
        return objects
    }
}
