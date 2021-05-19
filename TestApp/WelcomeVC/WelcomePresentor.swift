//
//  WelcomePresentor.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation


protocol WelcomePresentationLogic: AnyObject {
    
}

class WelcomePresenter: WelcomePresentationLogic {
    
    weak var viewController: WelcomeDisplayLogic?
    
}
