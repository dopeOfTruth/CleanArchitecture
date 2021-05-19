//
//  AsteroidDetailVC.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit
import WebKit

protocol AsteroidDetailDisplayLogic: AnyObject {
    
}

class AsteroidDetailVC: UIViewController, AsteroidDetailDisplayLogic {
    
    let urlString: String
    
    var interactor: AsteroidDetailBusinessLogic?
    var router: (NSObjectProtocol & AsteroidDetailDataPassing & AsteroidDetailRoutingLogic)?
    lazy var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        ai.tintColor = .darkGray
        ai.center = view.center
        view.addSubview(ai)
        return ai
    }()
    
    var webView = WKWebView()
    
    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        activityIndicator.startAnimating()
        
        view.backgroundColor = .black
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.activityIndicator.stopAnimating()
        }
    }
    
    private func setupWebView() {
    
        webView = WKWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(webView)
        
        guard let url = URL(string: urlString) else { return }
        
        DispatchQueue.main.async {
            
            self.webView.load(URLRequest(url: url))
        }
    }
}
