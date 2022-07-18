//
//  SortDetailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

import DataProvider

protocol SortDetailRoute {
    func pushSortDetail(model: GameModel)
}

extension SortDetailRoute where Self: RouterProtocol {
    
    func pushSortDetail(model: GameModel) {
        let router = SortDetailRouter()
        let viewModel = SortDetailViewModel(model: model, router: router)
        let viewController = SortDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
