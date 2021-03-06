//
//  MoreDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/24/22.
//

import Foundation
import DataProvider

protocol MoreDetailViewModelDelegate {
    func presentSafariButtonTapped()
}

protocol MoreDetailViewDataSource {
    var model : GameModel { get }
}

protocol MoreDetailViewEventSource {}

protocol MoreDetailViewProtocol: MoreDetailViewDataSource, MoreDetailViewEventSource {}

final class MoreDetailViewModel: BaseViewModel<MoreDetailRouter>, MoreDetailViewProtocol , MoreDetailViewModelDelegate {
 
    var model: GameModel
    
    
    public init(model: GameModel , router: MoreDetailRouter) {
        self.model = model
        super.init(router: router)
    }
}

// MARK: - Actions
extension MoreDetailViewModel {
    
    func presentSafariButtonTapped() {
        let url = URL(string: model.openGiveaway ?? "")
        router.presentInSafari(with: url!)
    }
}
