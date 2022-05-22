//
//  FourthVCViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation


protocol FourthVCViewProtocol {
    func viewDidLoad()
    func startButtonTapped()
}

final class FourthVCViewModel: BaseViewModel<HomeRouter>, FourthVCViewProtocol {
    func startButtonTapped() {
        let transition = ModalTransition(modalTransitionStyle: .partialCurl, modalPresentationStyle: .fullScreen)
        router.open(MainOnboardPageController(), transition: transition)
    }
    
    func viewDidLoad() {
        print("didLoad")
    }
}
