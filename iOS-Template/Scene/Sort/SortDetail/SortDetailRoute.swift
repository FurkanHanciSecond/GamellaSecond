//
//  SortDetailRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

protocol SortDetailRoute {
    func pushSortDetail()
}

extension SortDetailRoute where Self: RouterProtocol {
    
    func pushSortDetail() {
        let router = SortDetailRouter()
        let viewModel = SortDetailViewModel(router: router)
        let viewController = SortDetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
