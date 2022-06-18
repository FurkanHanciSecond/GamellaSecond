//
//  MainTabBarRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/18/22.
//

protocol MainTabBarRoute {
    func placeOnWindowMainTabBar()
}

extension MainTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowMainTabBar() {
        let router = MainTabBarRouter()
        let viewModel = MainTabBarViewModel(router: router)
        let viewController = MainTabBarController()
        viewController.viewModel = viewModel
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
