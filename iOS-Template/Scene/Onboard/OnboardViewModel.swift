//
//  OnboardViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/18/22.
//

import Foundation

protocol OnboardViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> OnboardCellProtocol
}

protocol OnboardViewEventSource {}

protocol OnboardViewProtocol: OnboardViewDataSource, OnboardViewEventSource {}

final class OnboardViewModel: BaseViewModel<OnboardRouter>, OnboardViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> OnboardCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [OnboardCellProtocol] = []
    
}
