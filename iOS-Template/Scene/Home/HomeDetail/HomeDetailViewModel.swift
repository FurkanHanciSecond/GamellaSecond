//
//  HomeDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import Foundation
import DataProvider

protocol HomeDetailViewModelDelegate {
    func shareButtonTapped()
    func presentSafariButtonTapped()
}

protocol HomeDetailViewDataSource {
    var model : GameModel { get }
}

protocol HomeDetailViewEventSource {
}

protocol HomeDetailViewProtocol: HomeDetailViewDataSource, HomeDetailViewEventSource {}

final class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewProtocol , HomeDetailViewModelDelegate {
    var model: GameModel
    
    
    public init(model: GameModel , router: HomeDetailRouter) {
        self.model = model
        super.init(router: router)
    }
}

// MARK: - Actions
extension HomeDetailViewModel {
    func shareButtonTapped() {
        let text = "Hey you should see this game giveaway now! \(model.gamerpowerURL ?? "")" as Any
        router.presentShareSheet(items: [text])
    }
    
    func presentSafariButtonTapped() {
        let url = URL(string: model.gamerpowerURL ?? "")
        router.presentInSafari(with: url!)
    }
}
