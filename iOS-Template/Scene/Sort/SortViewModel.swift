//
//  SortViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation

protocol SortViewDataSource {}

protocol SortViewEventSource {}

protocol SortViewProtocol: SortViewDataSource, SortViewEventSource {}

final class SortViewModel: BaseViewModel<SortRouter>, SortViewProtocol {
    
}
