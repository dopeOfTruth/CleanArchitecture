//
//  APODModels.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

enum APOD {
    
    enum ShowAPOD {
        
        struct Request {
            
        }
        
        struct Response {
            let apod: APODModel
        }
        
        struct ViewModel {
            let webContent: URL
            let title: String 
            let explanation: String
        }
    }
}
