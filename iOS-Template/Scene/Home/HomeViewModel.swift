//
//  HomeViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation
import UIComponents
import MobilliumUserDefaults

protocol HomeViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol
}

protocol HomeViewEventSource {
    func didload()
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    func didload() {
        print(DefaultsKey.isFirstRun.value)
    }
    
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [HomeCellProtocol] = []
}
