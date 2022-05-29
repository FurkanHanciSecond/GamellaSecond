//
//  SettingsViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation

protocol SettingsViewDataSource {}

protocol SettingsViewEventSource {}

protocol SettingsViewProtocol: SettingsViewDataSource, SettingsViewEventSource {}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewProtocol {
    
}
