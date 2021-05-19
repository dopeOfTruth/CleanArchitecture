//
//  AsteroidDetailRouter.swift
//  TestApp
//
//  Created by Михаил Красильник on 19.05.2021.
//

import Foundation

@objc protocol AsteroidDetailRoutingLogic {

}

protocol AsteroidDetailDataPassing {
    var dataStore: AsteroidDetailDataStore? { get }
}

class AsteroidDetailRouter: NSObject, AsteroidDetailRoutingLogic, AsteroidDetailDataPassing {
    
    var dataStore: AsteroidDetailDataStore?
    weak var viewController: AsteroidDetailVC?
}
