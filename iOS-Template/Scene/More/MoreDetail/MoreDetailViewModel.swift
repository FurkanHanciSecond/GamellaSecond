//
//  MoreDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/24/22.
//

import Foundation
import DataProvider

protocol MoreDetailViewDataSource {
    var model : GameModel { get }
}

protocol MoreDetailViewEventSource {}

protocol MoreDetailViewProtocol: MoreDetailViewDataSource, MoreDetailViewEventSource {}

final class MoreDetailViewModel: BaseViewModel<MoreDetailRouter>, MoreDetailViewProtocol {
 
    var model: GameModel
    
    
    public init(model: GameModel , router: MoreDetailRouter) {
        self.model = model
        super.init(router: router)
    }
}
