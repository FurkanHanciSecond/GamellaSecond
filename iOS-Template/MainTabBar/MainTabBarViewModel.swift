//
//  MainTabBarViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation

protocol MainTabBarViewDataSource {}

protocol MainTabBarViewEventSource {}

protocol MainTabBarViewProtocol: MainTabBarViewDataSource, MainTabBarViewEventSource {}

final class MainTabBarViewModel: BaseViewModel<MainTabBarRouter>, MainTabBarViewProtocol {
    
}
