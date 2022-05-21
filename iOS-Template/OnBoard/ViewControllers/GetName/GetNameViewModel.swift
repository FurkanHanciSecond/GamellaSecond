//
//  GetNameViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/21/22.
//

import Foundation

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
        print("didLoad")
    }
}
