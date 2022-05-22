//
//  FourthVCRoute.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation

protocol FourthVCRoute {
    func presentGetName()
}

extension FourthVCRoute where Self: RouterProtocol {
    
//    func presentGetName() {
//        let router = FourthVCRouter()
//        let viewModel = FourthVCViewModel(router: router)
//        let viewController = FourthOnboardVC(viewModel: viewModel)
//
//        let transition = ModalTransition()
//        router.viewController = viewController
//        router.openTransition = transition
//
//        let navController = CleanNavigationController(rootViewController: viewController)
//
//        open(navController, transition: transition)
//    }
    
    
    /*
     PushTransition() sadece UINAvigationController ekranından çalışır.
     ModalTransition() navigation + default viewcontroller ekranından çarğılabilir.
     OnWindow çağırırsan tüm ekranları deinit yapar.
     */
}
