//
//  MoreDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/24/22.
//

import Foundation

protocol MoreDetailViewDataSource {}

protocol MoreDetailViewEventSource {}

protocol MoreDetailViewProtocol: MoreDetailViewDataSource, MoreDetailViewEventSource {}

final class MoreDetailViewModel: BaseViewModel<MoreDetailRouter>, MoreDetailViewProtocol {
    
}
