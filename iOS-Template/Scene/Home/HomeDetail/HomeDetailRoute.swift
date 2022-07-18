//
//  HomeDetailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import DataProvider

protocol HomeDetailRoute {
    func pushHomeDetail(model: GameModel)
}

extension HomeDetailRoute where Self: RouterProtocol {
    
    func pushHomeDetail(model: GameModel) {
        let router = HomeDetailRouter()
        let viewModel = HomeDetailViewModel(model: model, router: router)
        let viewController = HomeDetailViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
