//
//  AsteroidDetailInteractor.swift
//  TestApp
//
//  Created by Михаил Красильник on 19.05.2021.
//

import Foundation

protocol AsteroidDetailBusinessLogic: AnyObject {
    
    
}

protocol AsteroidDetailDataStore: AnyObject {
    
}


class AsteroidDetailInteractor: AsteroidDetailBusinessLogic, AsteroidDetailDataStore {
    
    var presenter: AsteroidDetailPresentationLogic?
    
    
}
