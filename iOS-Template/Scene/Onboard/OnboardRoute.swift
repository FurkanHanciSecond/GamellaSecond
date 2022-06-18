//
//  OnboardRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/18/22.
//

protocol OnboardRoute {
    func presentOnboard()
}

extension OnboardRoute where Self: RouterProtocol {
    
    func presentOnboard() {
        let router = OnboardRouter()
        let viewModel = OnboardViewModel(router: router)
        let viewController = OnboardViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
