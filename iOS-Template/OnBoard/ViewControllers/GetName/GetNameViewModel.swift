//
//  GetNameViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/21/22.
//

import Foundation
import MobilliumUserDefaults
protocol GetNameViewProtocol {
    func viewDidLoad()
    func nextButtonTapped()
}

final class GetNameViewModel: BaseViewModel<GetNameRouter>, GetNameViewProtocol {
    func nextButtonTapped() {
        let transition = ModalTransition(modalTransitionStyle: .flipHorizontal, modalPresentationStyle: .fullScreen)
        router.open(MainOnboardPageController(), transition: transition)
    }
    
    func viewDidLoad() {
        // MARK: - PLEASE DO IT ARCHITECTURAL AMK
        let router = HomeRouter()
        let transition = PlaceOnWindowTransition()
        let viewController = HomeViewController(viewModel: HomeViewModel.init(router: router))
        let navController = CleanNavigationController(rootViewController: viewController)
        switch DefaultsKey.isFirstRun.value {
        case .init(booleanLiteral: false):
            router.open(navController, transition: transition)
            
        default:
            break;
        }
    }
}
