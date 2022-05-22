//
//  GetNameRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/21/22.
//

import Foundation

protocol GetNameRoute {
    func presentGetName()
}

extension GetNameRoute where Self: RouterProtocol {
    
    func presentGetName() {
        let router = GetNameRouter()
        let viewModel = GetNameViewModel(router: router)
        let viewController = GetNameVC(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        let navController = CleanNavigationController(rootViewController: viewController)
        
        open(navController, transition: transition)
    }
    
    
    /*
     PushTransition() sadece UINAvigationController ekranından çalışır.
     ModalTransition() navigation + default viewcontroller ekranından çarğılabilir.
     OnWindow çağırırsan tüm ekranları deinit yapar.
     */
}
