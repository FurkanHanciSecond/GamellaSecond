//
//  SortDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

import Foundation
import DataProvider

protocol SortDetailViewDataSource {
    var model : GameModel { get }
}

protocol SortDetailViewEventSource {}

protocol SortDetailViewProtocol: SortDetailViewDataSource, SortDetailViewEventSource {}

final class SortDetailViewModel: BaseViewModel<SortDetailRouter>, SortDetailViewProtocol {
    var model: GameModel
    
   public init(model: GameModel , router: SortDetailRouter) {
       self.model = model
        super.init(router: router)
    }
}
