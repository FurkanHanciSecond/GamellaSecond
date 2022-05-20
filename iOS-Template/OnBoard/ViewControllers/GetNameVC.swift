//
//  GetNameVC.swift
//  Gamella
//
//  Created by Furkan Hanci on 4/28/22.
//

import UIKit
import MobilliumBuilders
import MobilliumUserDefaults
class GetNameVC: UIViewController {
    
    private let welcomeText = UILabelBuilder()
        .textColor(.label)
        .numberOfLines(0)
        .font(.systemFont(ofSize: 30, weight: .semibold))
        .numberOfLines(0)
        .build()
    
    private let getNameTextField = UITextFieldBuilder()
        .placeholder("Enter your name here...")
        .borderStyle(.roundedRect)
        .textColor(.gray)
        .borderWidth(0.5)
        .cornerRadius(10)
        .build()
    
    private let nextButton = UIButtonBuilder()
        .titleColor(.white, for: .normal)
        .title("Next")
        .titleFont(.systemFont(ofSize: 25, weight: .bold))
        .backgroundColor(.systemIndigo)
        .cornerRadius(20)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        setupLayout()
        setupText()
        configureButton()
    }
    
    private func setupText() {
        welcomeText.text = "Hi, game lover! What is your name?"
    }
    
    private func configureButton() {
        nextButton.addTarget(self, action: #selector(nextButtonHandle(_:)), for: .touchUpInside)
    }
    
    @objc private func nextButtonHandle(_ sender: UIButton) {
        DefaultsKey.userName.value = getNameTextField.text
        print(DefaultsKey.userName.value)
    }
    
    private func setupLayout() {
        let padding : CGFloat = 20
        let buttonPadding : CGFloat = 30
        view.addSubviews(welcomeText , getNameTextField , nextButton)
        welcomeText.translatesAutoresizingMaskIntoConstraints = false
        getNameTextField.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeText.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: -padding - 110),
            welcomeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            welcomeText.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: padding),
            
            getNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getNameTextField.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: padding),
            getNameTextField.widthAnchor.constraint(equalTo: view.widthAnchor , constant: -padding),
            
            nextButton.centerXAnchor.constraint(equalTo: welcomeText.centerXAnchor , constant: -padding),
            nextButton.topAnchor.constraint(equalTo: getNameTextField.bottomAnchor, constant: buttonPadding),
            nextButton.widthAnchor.constraint(equalToConstant: 280),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    deinit {
        debugPrint("the class has been deinit \(self)")
    }

}
