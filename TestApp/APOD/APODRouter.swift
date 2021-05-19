//
//  APODRouter.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import UIKit

@objc protocol APODRoutingLogic {
    
}

protocol APODDataPassing {
    var dataStore: APODDataStore? { get }
}


class APODRouter: NSObject, APODRoutingLogic, APODDataPassing {
    
    
    weak var viewController: APODViewController?
    var dataStore: APODDataStore?
    
    
}
