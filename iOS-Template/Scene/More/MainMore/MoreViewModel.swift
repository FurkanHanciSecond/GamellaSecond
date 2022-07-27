//
//  MoreViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation
import MobilliumUserDefaults
protocol MoreViewDataSource {
    var numberOfItems: Int { get }
    func cellForItemAt(indexPath: IndexPath) -> MoreCellProtocol
    func didSelectItemAt(indexPath: IndexPath)
    func didSelectPopItemAt(type: String)
    func didSelectAllPopItem()
}

protocol MoreViewEventSource {
    var title: String { get }
}

protocol MoreViewProtocol: MoreViewDataSource, MoreViewEventSource {
    func viewDidLoad()
    func willAppear()
    func refreshData()
}

final class MoreViewModel: BaseViewModel<MoreRouter>, MoreViewProtocol {
    var title: String {
        return "More"
    }
    
    // Privates
    var model : [GameModel] = []
    var cellItems: [MoreCellProtocol] = []
    
    // DataSource
    var numberOfItems: Int {
        return cellItems.count
    }
    
    // EventSource
    var reloadData: VoidClosure?
    
    func didSelectPopItemAt(type: String) {
        getPremiumRequest(type: type)
    }
    
    func viewDidLoad() {
        getPremiumRequest(type: "beta")
    }
    
    func willAppear() {
        if let isFirst = DefaultsKey.isFirstRun.value {
            if isFirst {
                router.presentNotPremium()
            }
        }
    }
    
    func refreshData() {
        getPremiumRequest(type: "beta")
    }
    
    func didSelectAllPopItem() {
        getAllGiveAway()
    }
    
    
    
    
}

// MARK: - DataSource
extension MoreViewModel {
    func cellForItemAt(indexPath: IndexPath) -> MoreCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let index = cellItems[indexPath.row].title
        router.pushMoreDetail(model: model[indexPath.row])
    }
    
}

// MARK: - DataSource
extension MoreViewModel {
    private func configureCell(cellItem: [GameModel]) {
        let item = cellItem.map({ MoreCellModel(title: $0.title ?? "", priceLabel: $0.worth ?? "", statusLabel: $0.status?.rawValue ?? "Error", deadLineLabel: $0.endDate ?? "" , typeLabel: $0.type?.rawValue ?? "Error", imageData: $0.thumbnail ?? "") })
        cellItems = item
    }
}


// MARK: - Requests
extension MoreViewModel {
    
    private func getPremiumRequest(type: String) {
        showLoading?()
        let premiumRequest = PremiumDataRequest(type: type)
        dataProvider?.request(for: premiumRequest, result: { [weak self] data in
            guard let self = self else { return }
            switch data {
            case .failure(let error):
                print(error.localizedDescription)
                EntryKitHelper.show("Error!", additionalMessage: "No active giveaways available at the moment, please try again later", type: .error, statusBar: .ignored)
                
                
            case .success(let response):
                self.model = response
                self.configureCell(cellItem: response)
                self.hideLoading?()
                self.reloadData?()
            }
        })
        
    }
    
    private func getAllGiveAway() {
        let allDataRequest = AllGiveawayRequest()
        dataProvider?.request(for: allDataRequest, result: { [weak self] data in
            guard let self = self else { return }
            switch data {
            case .failure(let error):
                print(error.localizedDescription)
                EntryKitHelper.show("Error!", additionalMessage: "No active giveaways available at the moment, please try again later", type: .error, statusBar: .ignored)
                
                
            case .success(let response):
                self.model = response
                self.configureCell(cellItem: response)
                self.hideLoading?()
                self.reloadData?()
            }
        })
    }
}
