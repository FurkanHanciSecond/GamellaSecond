//
//  SettingsViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation
import StoreKit
import Utilities
protocol SettingsViewModelDelegate {
    func feedBackButtonTapped()
    func shareButtonTapped()
    func rateButtonTapped()
    func premiumTapped()
}

protocol SettingsViewDataSource {
    func configureCellItem() -> SettingsThirdCellProtocol?
}

protocol SettingsViewEventSource {
    var title: String { get }
    var setViewModel: VoidClosure? { get set }
}

protocol SettingsViewProtocol: SettingsViewDataSource, SettingsViewEventSource {
    func didLoad()
    func presentPaywall()
}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewProtocol , SettingsViewModelDelegate {
    func configureCellItem() -> SettingsThirdCellProtocol? {
        return cellItems
    }
    
    var cellItems: SettingsThirdCellProtocol?
    
    
    var title: String {
        return "Settings"
    }
    
    // EventSource
    var reloadData: VoidClosure?
    var setViewModel: VoidClosure?
    
    func didLoad() {
        getGiveawayDatas()
    }
    
    func presentPaywall() {
        router.presentPaywall()
    }
}

// MARK: - DataSource
extension SettingsViewModel {
    
}

// MARK: - DataSource
extension SettingsViewModel {
    
    private func configureCell(cellItem: GiveAwayModel) {

        let model = SettingsThirdCellModel(activeGiveAways: cellItem.activeGiveawaysNumber, totalGiveAwaysWorth: cellItem.worthEstimationUsd)
        cellItems = model
    }
}

// MARK: - Requests
extension SettingsViewModel {
    private func getGiveawayDatas() {
        showLoading?()
        let request = GiveAwayDataRequest()
        dataProvider?.request(for: request, result: { [weak self] data in
            guard let self = self else { return }
            switch data {
            case .failure(let error):
                print(error.localizedDescription)
                EntryKitHelper.show("Error!", additionalMessage: "No active data at the moment, please try again later", type: .error, statusBar: .ignored)
                
                
            case .success(let response):
                self.configureCell(cellItem: response)
                self.hideLoading?()
                self.reloadData?()
            }
        })
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
    
    func premiumTapped() {
        router.presentPaywall()
    }
}
