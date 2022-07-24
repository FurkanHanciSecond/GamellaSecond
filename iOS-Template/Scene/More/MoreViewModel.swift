//
//  MoreViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation

protocol MoreViewDataSource {}

protocol MoreViewEventSource {
    var title: String { get }
}

protocol MoreViewProtocol: MoreViewDataSource, MoreViewEventSource {}

final class MoreViewModel: BaseViewModel<MoreRouter>, MoreViewProtocol {
    var title: String {
        return "More"
    }
    
    
}
