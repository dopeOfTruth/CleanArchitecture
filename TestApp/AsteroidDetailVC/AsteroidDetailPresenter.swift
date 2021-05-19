//
//  AsteroidDetailPresenter.swift
//  TestApp
//
//  Created by Михаил Красильник on 19.05.2021.
//

import Foundation

protocol AsteroidDetailPresentationLogic: AnyObject {
    
}

class AsteroidDetailPresenter: AsteroidDetailPresentationLogic {
    
    weak var viewController: AsteroidDetailDisplayLogic?
    
}
