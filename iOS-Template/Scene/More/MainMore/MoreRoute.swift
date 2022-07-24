//
//  MoreRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

protocol MoreRoute {
    func pushMore()
}

extension MoreRoute where Self: RouterProtocol {
    
    func pushMore() {
        let router = MoreRouter()
        let viewModel = MoreViewModel(router: router)
        let viewController = MoreViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
