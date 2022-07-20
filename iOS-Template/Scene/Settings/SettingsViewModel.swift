//
//  SettingsViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation

protocol SettingsViewDataSource {}

protocol SettingsViewEventSource {
    var title: String { get }
}

protocol SettingsViewProtocol: SettingsViewDataSource, SettingsViewEventSource {}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewProtocol {
    var title: String {
        return "Settings"
    }
    
    
}
