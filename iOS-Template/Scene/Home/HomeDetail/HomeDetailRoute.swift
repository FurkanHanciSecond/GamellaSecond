//
//  HomeDetailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

protocol HomeDetailRoute {
    func pushHomeDetail(with indexPath: IndexPath)
}

extension HomeDetailRoute where Self: RouterProtocol {
    
    func pushHomeDetail(with indexPath: IndexPath) {
        let router = HomeDetailRouter()
        let viewModel = HomeDetailViewModel(router: router)
        let viewController = HomeDetailViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
