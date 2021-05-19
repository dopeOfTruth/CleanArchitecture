//
//  ViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit


protocol WelcomeDisplayLogic: AnyObject {
    
}

class WelcomeViewController: UIViewController, WelcomeDisplayLogic {

    let goToApodVCButton = UIButton(title: "Astronomy Picture of the Day", titleColor: .white, backgroundColor: .backgroundForElements(), fontSize: 20, cornerRadius: 8)
    let goToAsteroidsVCButton = UIButton(title: "Near Earth Objects", titleColor: .white, backgroundColor: .backgroundForElements(), fontSize: 20, cornerRadius: 8)
    
    var interactor: WelcomeBusinessLogic?
    var router: (NSObjectProtocol & WelcomeRoutingLogic & WelcomeDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBackground()
        navigationController?.navigationBar.barTintColor = .backgroundForElements()
        setupConstraints()
        
        goToAsteroidsVCButton.addTarget(self, action: #selector(goToAsteroidsVCButtonTapped), for: .touchUpInside)
        goToApodVCButton.addTarget(self, action: #selector(goToApodVCButtonTapped), for: .touchUpInside)
        
        WelcomeConfigurator.shared.configure(view: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
              router.perform(selector, with: segue)
            }
        }
    }
    
    
    @objc private func goToAsteroidsVCButtonTapped() {
//        let asteroidsVC = AsteroidsViewController()
//        navigationController?.pushViewController(asteroidsVC, animated: true)
        router?.routeToAsteroids(segue: nil)
    }
    
    @objc private func goToApodVCButtonTapped() {
        router?.routeToAPOD(segue: nil)
    }
}

extension WelcomeViewController {
    
    private func setupConstraints() {
        
        let stackView = UIStackView(arrangedSubviews: [goToApodVCButton, goToAsteroidsVCButton], axis: .vertical, spacing: 20)
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        let verticalPadding = view.frame.height / 2 - 60
        let horizontalPadding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: verticalPadding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -verticalPadding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalPadding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalPadding)
        ])
    }
}
