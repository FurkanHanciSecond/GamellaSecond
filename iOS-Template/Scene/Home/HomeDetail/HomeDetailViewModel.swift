//
//  HomeDetailViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import Foundation

protocol HomeDetailViewDataSource {}

protocol HomeDetailViewEventSource {}

protocol HomeDetailViewProtocol: HomeDetailViewDataSource, HomeDetailViewEventSource {}

final class HomeDetailViewModel: BaseViewModel<HomeDetailRouter>, HomeDetailViewProtocol {
    
}
