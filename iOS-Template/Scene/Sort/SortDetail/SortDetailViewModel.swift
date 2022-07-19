//
//  SortDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

import Foundation
import DataProvider

protocol SortDetailViewModelDelegate {
    func shareButtonTapped()
    func presentSafariButtonTapped()
}

protocol SortDetailViewDataSource {
    var model : GameModel { get }
}

protocol SortDetailViewEventSource {
    
}

protocol SortDetailViewProtocol: SortDetailViewDataSource, SortDetailViewEventSource {}

final class SortDetailViewModel: BaseViewModel<SortDetailRouter>, SortDetailViewProtocol , SortDetailViewModelDelegate {
    var model: GameModel
    
   public init(model: GameModel , router: SortDetailRouter) {
       self.model = model
        super.init(router: router)
    }
}

// MARK: - Actions
extension SortDetailViewModel {
    func shareButtonTapped() {
        let text = "Hey you should see this game giveaway now! \(model.gamerpowerURL ?? "") and it's just \(model.worth ?? "")" as Any
        router.presentShareSheet(items: [text])
    }
    
    func presentSafariButtonTapped() {
        let url = URL(string: model.openGiveaway ?? "")
        router.presentInSafari(with: url!)
    }
}
