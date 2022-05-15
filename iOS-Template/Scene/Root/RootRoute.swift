//
//  RootRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/15/22.
//

protocol RootRoute {
    func rootOnWindow()
}

extension RootRoute where Self: RouterProtocol {
    
    func rootOnWindow() {
        let router = RootRouter()
        let viewModel = RootViewModel(router: router)
        let viewController = RootViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
