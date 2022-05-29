//
//  SortRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

protocol SortRoute {
    func pushSort()
}

extension SortRoute where Self: RouterProtocol {
    
    func pushSort() {
        let router = SortRouter()
        let viewModel = SortViewModel(router: router)
        let viewController = SortViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
