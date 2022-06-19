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

// MARK: -  Splash
final class GetNameViewModel: BaseViewModel<GetNameRouter>, GetNameViewProtocol {
    
    func nextButtonTapped() {
        router.presentOnboard()
    }
    
    func viewDidLoad() {
        if let isFirst = DefaultsKey.isFirstRun.value {
            if isFirst {
                router.placeOnWindowMainTabBar()
            }
        }
    }
}
