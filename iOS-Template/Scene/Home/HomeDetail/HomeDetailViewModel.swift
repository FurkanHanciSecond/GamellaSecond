//
//  HomeDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import Foundation
import MobilliumUserDefaults
import UIKit
protocol HomeDetailViewModelDelegate {
    func shareButtonTapped()
    func presentSafariButtonTapped()
}

protocol HomeDetailViewDataSource {
    var model : GameModel { get }
}

protocol HomeDetailViewEventSource {
    var backgroundColor : UIColor { get }
}

protocol HomeDetailViewProtocol: HomeDetailViewDataSource, HomeDetailViewEventSource {
    func presentPaywall()
    func checkHomePremium()
}

final class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewProtocol , HomeDetailViewModelDelegate {
    var model: GameModel
    
    var backgroundColor: UIColor {
        return AppConstants.Style.Color.systemBackground
    }
    
    func checkHomePremium() {
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
        let url = URL(string: model.openGiveaway ?? "")
        router.presentInSafari(with: url!)
    }
}
