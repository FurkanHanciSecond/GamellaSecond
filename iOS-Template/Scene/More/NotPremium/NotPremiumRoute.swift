//
//  NotPremiumRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/27/22.
//

protocol NotPremiumRoute {
    func presentNotPremium()
}

extension NotPremiumRoute where Self: RouterProtocol {
    
    func presentNotPremium() {
        let router = NotPremiumRouter()
        let viewModel = NotPremiumViewModel(router: router)
        let viewController = NotPremiumViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
