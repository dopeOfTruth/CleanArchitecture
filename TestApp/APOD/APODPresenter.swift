//
//  APODPresenter.swift
//  TestApp
//
//  Created by Михаил Красильник on 12.05.2021.
//

import Foundation

protocol APODPresentationLogic: AnyObject {
    func presentAPOD(response: APOD.ShowAPOD.Response)
}

class APODPresenter: APODPresentationLogic {

    weak var viewController: APODDisplayLogic?
    
    func presentAPOD(response: APOD.ShowAPOD.Response) {
        
        guard let url = URL(string: response.apod.url) else { return }
        
        let viewModel = APOD.ShowAPOD.ViewModel(webContent: url,
                                                title: response.apod.title,
                                                explanation: response.apod.explanation)
        
        viewController?.displayAPOD(viewModel: viewModel)
    }
}
