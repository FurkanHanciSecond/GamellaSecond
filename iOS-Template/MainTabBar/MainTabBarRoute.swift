//
//  MainTabBarRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/18/22.
//

protocol MainTabBarRoute {
    func presentMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func presentMainTabBar() {
        let router = MainTabBarRouter()
        let viewModel = MainTabBarViewModel(router: router)
        let viewController = MainTabBarViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
