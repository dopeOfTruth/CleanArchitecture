//
//  APODViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit
import WebKit

protocol APODDisplayLogic: AnyObject {
    func displayAPOD(viewModel: APOD.ShowAPOD.ViewModel)
    
}

class APODViewController: UIViewController, APODDisplayLogic {

    
    var webView = WKWebView()
    let titleLabel = UILabel()
    let textView = UITextView()
    
    var interactor: APODBusinessLogic?
    var router: (NSObjectProtocol & APODRoutingLogic & APODDataPassing)?
    
    var apod: APODModel?
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        APODConfigurator.shared.configure(view: self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        APODConfigurator.shared.configure(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = APOD.ShowAPOD.Request()
        interactor?.fetchAPOD(request: request)
        
        webView.backgroundColor = .backgroundForElements()
        view.backgroundColor = .mainBackground()
        setupConstraints()
        settingElements()
    }
    
    private func settingElements() {
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        titleLabel.textColor = .white
        
        textView.textColor = .white
        textView.backgroundColor = .mainBackground()
        textView.font = UIFont.systemFont(ofSize: 18)
    }
    
    
    func displayAPOD(viewModel: APOD.ShowAPOD.ViewModel) {
        
        self.titleLabel.text = viewModel.title
        
        self.textView.text = viewModel.explanation
        
        self.webView.load(URLRequest(url: viewModel.webContent))
    }
}

extension APODViewController {
    
    private func setupConstraints() {
        
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = false
        self.webView = WKWebView(frame: .zero, configuration: configuration)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: view.frame.height / 3)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
}
