//
//  FourthOnboardVC.swift
//  Gamella
//
//  Created by Furkan Hanci on 4/28/22.
//

import UIKit
import MobilliumBuilders
import MobilliumUserDefaults
class FourthOnboardVC: UIViewController {
    private var router : HomeRouter = HomeRouter()
    private let onboardTitle = UILabelBuilder()
        .font(.systemFont(ofSize: 50, weight: .thin))
        .textColor(.label)
        .numberOfLines(0)
        .build()
    
    private let onboardDescription = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .regular))
        .textColor(.label)
        .numberOfLines(0)
        .adjustsFontSizeToFitWidth(true)
        .minimumScaleFactor(0.5)
        .build()
    
    private let startButton = UIButtonBuilder()
        .cornerRadius(20)
        .title(AppConstants.Texts.Button.onboardButtonText)
        .titleFont(.systemFont(ofSize: 20))
        .backgroundColor(AppConstants.Style.Color.indigo!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        setupTexts()
        setupLayout()
        configureButton()
        view.backgroundColor = .systemBackground
    }
    
    private func setupTexts() {
        onboardTitle.text = "Gamella"
        onboardDescription.text = "You can also see free games on all platfroms and all of features."
    }
    
    private func configureButton() {
        startButton.addTarget(self, action: #selector(startButtonHandle(_:)), for: .touchUpInside)
    }
    
    @objc private func startButtonHandle(_ sender: UIButton) {
        //TODO: MIMARIYE UYGUN YAP AMK 😡
        let tabBar = MainTabBarController()
       // let cleanNavigation = CleanNavigationController(rootViewController: MainTabBarController())
        tabBar.modalTransitionStyle = .partialCurl
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true, completion: nil)
        DefaultsKey.isFirstRun.value = false
    }
    
    private func setupLayout() {
        let descriptionPadding : CGFloat = 20
        view.addSubviews(onboardTitle , onboardDescription , startButton)
        
        onboardTitle.translatesAutoresizingMaskIntoConstraints = false
        onboardDescription.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            onboardTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            onboardDescription.topAnchor.constraint(equalTo: onboardTitle.bottomAnchor, constant: descriptionPadding),
            onboardDescription.centerXAnchor.constraint(equalTo: onboardTitle.centerXAnchor),
            onboardDescription.widthAnchor.constraint(equalToConstant: 350),
            onboardDescription.heightAnchor.constraint(equalToConstant: 80),
            
            startButton.centerXAnchor.constraint(equalTo: onboardTitle.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: onboardDescription.bottomAnchor , constant: descriptionPadding),
            startButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
