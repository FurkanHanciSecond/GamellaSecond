//
//  LoginRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/15/22.
//

import UIKit

protocol LoginRoute {
    func loginOnWindow()
}

extension LoginRoute where Self: RouterProtocol {
    
    func loginOnWindow() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
    
    /*
     PushTransition() sadece UINAvigationController ekranından çalışır.
     ModalTransition() navigation + default viewcontroller ekranından çarğılabilir.
     OnWindow çağırırsan tüm ekranları deinit yapar.
     */
}
