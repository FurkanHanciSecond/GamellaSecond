//
//  HomeDetailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

protocol HomeDetailRoute {
    func pushHomeDetail()
}

extension HomeDetailRoute where Self: RouterProtocol {
    
    func pushHomeDetail() {
        let router = HomeDetailRouter()
        let viewModel = HomeDetailViewModel(router: router)
        let viewController = HomeDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
