//
//  OnboardViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/18/22.
//

import Foundation
import MobilliumUserDefaults

protocol OnboardViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> OnboardCellProtocol
}

protocol OnboardViewEventSource {}

protocol OnboardViewProtocol: OnboardViewDataSource, OnboardViewEventSource {
    func didLoad()
    func presentMainTabBar()
}

final class OnboardViewModel: BaseViewModel<OnboardRouter>, OnboardViewProtocol {
    
    private var cellItems: [OnboardCellProtocol] = []
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> OnboardCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didLoad() {
        configureCellItems()
    }
}

// MARK: - Configure
extension OnboardViewModel {
    
    private func configureCellItems() {
        cellItems = [
            OnboardCellModel(description: "See the all free giveaway games!", title: "Gamella"),
            OnboardCellModel(description: "Get more detail about Game!", title: "Gamella"),
            OnboardCellModel(description: "Sort games by date, value and popularity", title: "Gamella"),
            OnboardCellModel(description: "Also, you can see dlc, beta keys and more!", title: "Gamella", isLast: true)
        ]
        DefaultsKey.isFirstRun.value = true
        DefaultsKey.isFirstBulletIn.value = true
    }
}

// MARK: - Routes
extension OnboardViewModel {
    
    func presentMainTabBar() {
        router.placeOnWindowMainTabBar()
    }
}
