//
//  SortDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

import Foundation
import DataProvider
import MobilliumUserDefaults
protocol SortDetailViewModelDelegate {
    func shareButtonTapped()
    func presentSafariButtonTapped()
}

protocol SortDetailViewDataSource {
    var model : GameModel { get }
}

protocol SortDetailViewEventSource {
    
}

protocol SortDetailViewProtocol: SortDetailViewDataSource, SortDetailViewEventSource {
    func presentPaywall()
    func checkSortPremium()
}

final class SortDetailViewModel: BaseViewModel<SortDetailRouter>, SortDetailViewProtocol , SortDetailViewModelDelegate {
    var model: GameModel
    
    func checkSortPremium() {
        if let isPremium = DefaultsKey.isPremium.value {
            if isPremium == false {
                router.presentPaywall()
                print(DefaultsKey.isPremium.value)
            }
        }
    }
    
    func presentPaywall() {
        router.presentPaywall()
    }
    
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
