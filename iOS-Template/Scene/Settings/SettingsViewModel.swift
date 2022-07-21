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

protocol SettingsViewDataSource {
    var numberOfItems: Int { get }
    func cellForItemAt(indexPath: IndexPath) -> SettingsThirdCellProtocol
}

protocol SettingsViewEventSource {
    var title: String { get }
}

protocol SettingsViewProtocol: SettingsViewDataSource, SettingsViewEventSource {
    func didLoad()
}

final class SettingsViewModel: BaseViewModel<SettingsRouter>, SettingsViewProtocol , SettingsViewModelDelegate {
    
    var title: String {
        return "Settings"
    }
    
    // Privates
     var model : GiveAwayModel?
     var cellItems: SettingsThirdCellProtocol?
    
    // DataSource
    var numberOfItems: Int {
        return 0
    }
    
    // EventSource
    var reloadData: VoidClosure?
    
    func didLoad() {
        getGiveawayDatas()
    }
    
    
}

// MARK: - DataSource
extension SettingsViewModel {
    
    func cellForItemAt(indexPath: IndexPath) -> SettingsThirdCellProtocol {
        return cellItems!
    }
}

// MARK: - DataSource
extension SettingsViewModel {
    
    private func configureCell(cellItem: GiveAwayModel) {
//        let item = cellItem.map({ SettingsThirdCellModel(activeGiveAways: $0.activeGiveawaysNumber, totalGiveAwaysWorth: $0.worthEstimationUsd) })
        //let item = [cellItem]
        let model = SettingsThirdCellModel(activeGiveAways: cellItem.activeGiveawaysNumber, totalGiveAwaysWorth: cellItem.worthEstimationUsd)
        cellItems = model
       // reloadData?()
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
                self.model = response
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
}
