//
//  HomeDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import Foundation
import DataProvider

protocol HomeDetailViewDataSource {
    var model : GameModel { get }
}

protocol HomeDetailViewEventSource {
}

protocol HomeDetailViewProtocol: HomeDetailViewDataSource, HomeDetailViewEventSource {}

final class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewProtocol {
    var model: GameModel
    public init(model: GameModel , router: HomeDetailRouter) {
        self.model = model
        super.init(router: router)
    }
    
}
