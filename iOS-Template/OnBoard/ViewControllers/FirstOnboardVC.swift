//
//  FirstOnboardVC.swift
//  Gamella
//
//  Created by Furkan Hanci on 4/28/22.
//

import UIKit
import MobilliumBuilders
class FirstOnboardVC: UIViewController {    
    private let onboardTitle = UILabelBuilder()
        .font(.systemFont(ofSize: 50, weight: .thin))
        .textColor(.label)
        .numberOfLines(0)
        .build()
    
    private let onboardDescription = UILabelBuilder()
        .font(.systemFont(ofSize: 30, weight: .regular))
        .textColor(.label)
        .numberOfLines(1)
        .adjustsFontSizeToFitWidth(true)
        .minimumScaleFactor(0.5)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupTexts()
        setupLayout()
        view.backgroundColor = .systemBackground
    }
    
    private func setupTexts() {
        onboardTitle.text = "Gamella"
        onboardDescription.text = "See the all free giveaway games!"
    }
    
    private func setupLayout() {
        let descriptionPadding : CGFloat = 20
        view.addSubviews(onboardTitle , onboardDescription)
        
        onboardTitle.translatesAutoresizingMaskIntoConstraints = false
        onboardDescription.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            onboardTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            onboardDescription.topAnchor.constraint(equalTo: onboardTitle.bottomAnchor, constant: descriptionPadding),
            onboardDescription.centerXAnchor.constraint(equalTo: onboardTitle.centerXAnchor),
            onboardDescription.widthAnchor.constraint(equalToConstant: 250),
            
        ])
    }
    
}
