//
//  SortDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

import Foundation

protocol SortDetailViewDataSource {}

protocol SortDetailViewEventSource {}

protocol SortDetailViewProtocol: SortDetailViewDataSource, SortDetailViewEventSource {}

final class SortDetailViewModel: BaseViewModel<SortDetailRouter>, SortDetailViewProtocol {
    
}
