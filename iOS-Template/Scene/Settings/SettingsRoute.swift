//
//  SettingsRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

protocol SettingsRoute {
    func pushSettings()
}

extension SettingsRoute where Self: RouterProtocol {
    
    func pushSettings() {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let viewController = SettingsViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
