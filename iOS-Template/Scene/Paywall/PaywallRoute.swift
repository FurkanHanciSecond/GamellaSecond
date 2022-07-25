//
//  PaywallRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/25/22.
//

protocol PaywallRoute {
    func presentPaywall()
}

extension PaywallRoute where Self: RouterProtocol {
    
    func presentPaywall() {
        let router = PaywallRouter()
        let viewModel = PaywallViewModel(router: router)
        let viewController = PaywallViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
