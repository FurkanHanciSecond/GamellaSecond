//
//  HomeDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import Foundation
import DataProvider

protocol HomeDetailViewDataSource {
    
}

protocol HomeDetailViewEventSource {
}

protocol HomeDetailViewProtocol: HomeDetailViewDataSource, HomeDetailViewEventSource {}

final class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewProtocol {
    private let cellIndex: IndexPath

    init(cellIndex: IndexPath , router: HomeDetailRouter) {
        self.cellIndex = cellIndex
        super.init(router: router)
    }
}
