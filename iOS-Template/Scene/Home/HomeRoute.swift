//
//  HomeRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/22/22.
//

protocol HomeRoute {
    func pushHome()
}

extension HomeRoute where Self: RouterProtocol {
    
    func pushHome() {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
