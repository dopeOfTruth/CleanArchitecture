//
//  ViewController.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    let goToApodVCButton = UIButton(title: "Astronomy Picture of the Day", titleColor: .white, backgroundColor: #colorLiteral(red: 0.1694421172, green: 0.1881708503, blue: 0.2226838171, alpha: 1), fontSize: 20, cornerRadius: 8)
    let goToAsteroidsVCButton = UIButton(title: "Near Earth Objects", titleColor: .white, backgroundColor: #colorLiteral(red: 0.1694421172, green: 0.1881708503, blue: 0.2226838171, alpha: 1), fontSize: 20, cornerRadius: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1105096862, green: 0.1294138432, blue: 0.1595476866, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1694421172, green: 0.1881708503, blue: 0.2226838171, alpha: 1)
        setupConstraints()
        
        goToAsteroidsVCButton.addTarget(self, action: #selector(goToAsteroidsVCButtonTapped), for: .touchUpInside)
        goToApodVCButton.addTarget(self, action: #selector(goToApodVCButtonTapped), for: .touchUpInside)
    }
    
    @objc private func goToAsteroidsVCButtonTapped() {
        let asteroidsVC = AsteroidsViewController()
        navigationController?.pushViewController(asteroidsVC, animated: true)
    }
    
    @objc private func goToApodVCButtonTapped() {
        let apodVC = APODViewController()
        navigationController?.pushViewController(apodVC, animated: true)
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