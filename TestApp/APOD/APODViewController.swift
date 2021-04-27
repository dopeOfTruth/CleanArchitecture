//
//  APODViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit
import WebKit

class APODViewController: UIViewController {

    let videoPlayer = WKWebView()
    let titleLabel = UILabel()
    let textView = UITextView()
    
    var apod: APODModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkDataFeatcher.shared.getAPOD { apod in
            self.apod = apod
            
            DispatchQueue.main.async {
                self.titleLabel.text = apod.title
                
                self.textView.text = apod.explanation
                
                guard let url = URL(string: apod.url) else { return }
                
                self.videoPlayer.load(URLRequest(url: url))
            }
        }
        
        videoPlayer.backgroundColor = .backgroundForElements()
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
}

extension APODViewController {
    
    private func setupConstraints() {
        
        videoPlayer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(videoPlayer)
        view.addSubview(titleLabel)
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            videoPlayer.topAnchor.constraint(equalTo: view.topAnchor),
            videoPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            videoPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            videoPlayer.heightAnchor.constraint(equalToConstant: view.frame.height / 3)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: videoPlayer.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
