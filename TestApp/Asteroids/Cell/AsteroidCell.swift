//
//  AsteroidCell.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import UIKit

class AsteroidCell: UICollectionViewCell {
    
    static var reuseId: String = "AsteroidCell"
    
    let asteroidNameLabel = UILabel()
    let relativeVelocityLabel = UILabel()
    let diameterLabel = UILabel()
    let separatorView = UIView()
    let dateLabel = UILabel()
    
    let containerView = UIView()
    
    private func setupConstraints() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        asteroidNameLabel.translatesAutoresizingMaskIntoConstraints = false
        relativeVelocityLabel.translatesAutoresizingMaskIntoConstraints = false
        diameterLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(containerView)
        containerView.addSubview(asteroidNameLabel)
        containerView.addSubview(relativeVelocityLabel)
        containerView.addSubview(diameterLabel)
        containerView.addSubview(separatorView)
        containerView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            asteroidNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            asteroidNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            asteroidNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: asteroidNameLabel.bottomAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
        ])
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            separatorView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            separatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
        
        NSLayoutConstraint.activate([
            relativeVelocityLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            relativeVelocityLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            relativeVelocityLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            diameterLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            diameterLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            diameterLabel.topAnchor.constraint(equalTo: relativeVelocityLabel.bottomAnchor, constant: 15)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
        settingsElements()
        
        
        self.layer.cornerRadius = 4
        self.layer.shadowColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.layer.cornerRadius = 4
        containerView.clipsToBounds = true
    }
    
    func settingsElements() {
        
        asteroidNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        relativeVelocityLabel.textColor = .white
        diameterLabel.textColor = .white
        asteroidNameLabel.textColor = .white
        dateLabel.textColor = .gray
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        dateLabel.textAlignment = .right
        
        separatorView.backgroundColor = .mainBackground()
        separatorView.layer.opacity = 0.6
    }
    
    func configure(with asteroid: Asteroids.FetchData.ViewModel.Object) {
        asteroidNameLabel.text = asteroid.asteroidName
        dateLabel.text = asteroid.date
        relativeVelocityLabel.text = asteroid.relativeVelocity
        diameterLabel.text = asteroid.diameter
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
