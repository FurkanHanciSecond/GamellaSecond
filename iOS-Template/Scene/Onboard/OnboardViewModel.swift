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
            OnboardCellModel(description: "aksjb", title: "Gamella"),
            OnboardCellModel(description: "jashdfkjs", title: "Gamella"),
            OnboardCellModel(description: "ajkshfj", title: "Gamella"),
            OnboardCellModel(description: "kjasbkjsdb", title: "Gamella", isLast: true)
        ]
        DefaultsKey.isFirstRun.value = true
    }
}

// MARK: - Routes
extension OnboardViewModel {
    
    func presentMainTabBar() {
        router.placeOnWindowMainTabBar()
    }
}
