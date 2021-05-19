//
//  WelcomeInteractor.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

protocol WelcomeBusinessLogic: AnyObject {
    
    
}

protocol WelcomeDataStore: AnyObject {
    
}


class WelcomeInteractor: WelcomeBusinessLogic, WelcomeDataStore {
    
    var presenter: WelcomePresentationLogic?
    
    
}
