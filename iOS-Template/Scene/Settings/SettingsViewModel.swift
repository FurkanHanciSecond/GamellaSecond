//
//  SettingsViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation
import StoreKit
protocol SettingsViewModelDelegate {
    func feedBackButtonTapped()
    func shareButtonTapped()
    func rateButtonTapped()
}

protocol SettingsViewDataSource {}

protocol SettingsViewEventSource {
    var title: String { get }
}

protocol SettingsViewProtocol: SettingsViewDataSource, SettingsViewEventSource {}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewProtocol , SettingsViewModelDelegate {
    
    var title: String {
        return "Settings"
    }
    
    
}

// MARK: - Actions
extension SettingsViewModel {
    func feedBackButtonTapped() {
        router.presentMailComposer()
    }
    
    func shareButtonTapped() {
        //TODO: Put App Link After Release
        let text = "Hey you should see this app I definitely love it!" as Any
        router.presentShareSheet(items: [text])
    }
    
    func rateButtonTapped() {
      //Empty
    }
}
