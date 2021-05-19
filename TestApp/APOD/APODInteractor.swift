//
//  APODInteractor.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

protocol APODBusinessLogic: AnyObject {
    
    func fetchAPOD(request: APOD.ShowAPOD.Request)
    
}

protocol APODDataStore {
    var apod: APODModel? { get }
}

class APODInteractor: APODBusinessLogic, APODDataStore {
    
    var presenter: APODPresentationLogic?
    var apod: APODModel?
    
    func fetchAPOD(request: APOD.ShowAPOD.Request) {
        
        NetworkDataFeatcher.shared.getAPOD { apod in
            DispatchQueue.main.async {
                self.apod = apod
                
                let response = APOD.ShowAPOD.Response(apod: apod)
                self.presenter?.presentAPOD(response: response)
            }
        }
    }
    
}
