//
//  MoreDetailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/24/22.
//
import DataProvider

protocol MoreDetailRoute {
    func pushMoreDetail(model: GameModel)
}

extension MoreDetailRoute where Self: RouterProtocol {
    
    func pushMoreDetail(model: GameModel) {
        let router = MoreDetailRouter()
        let viewModel = MoreDetailViewModel(model: model, router: router)
        let viewController = MoreDetailViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
