//
//  FourthOnboardVC.swift
//  Gamella
//
//  Created by Furkan Hanci on 4/28/22.
//

import UIKit
import MobilliumBuilders
class FourthOnboardVC: UIViewController {
    private let onboardDescription = UILabelBuilder()
        .font(.systemFont(ofSize: 24))
        .textColor(.red)
        .numberOfLines(0)
        .build()
    
    private let onboardTitle = UILabelBuilder()
        .font(.systemFont(ofSize: 24))
        .textColor(.red)
        .numberOfLines(0)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupTexts()
        setupLayout()
    }
    
    private func setupTexts() {
        onboardTitle.text = "AppConstants.appName"
        onboardDescription.text = "AppConstants.OnBoard.OnboardDescription.description4"
    }
    
    private func setupLayout() {
        let descriptionPadding : CGFloat = 20
        view.addSubviews(onboardTitle , onboardDescription)
        view.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            onboardTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            onboardDescription.topAnchor.constraint(equalTo: onboardTitle.bottomAnchor, constant: descriptionPadding),
            onboardDescription.centerXAnchor.constraint(equalTo: onboardTitle.centerXAnchor),
            onboardDescription.widthAnchor.constraint(equalToConstant: 350),
            onboardDescription.heightAnchor.constraint(equalToConstant: 80),
            
        ])
    }
    
    deinit {
        print("deinit \(self)")
    }
}