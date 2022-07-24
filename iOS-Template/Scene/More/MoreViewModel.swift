//
//  MoreViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation

protocol MoreViewDataSource {
    var numberOfItems: Int { get }
    func cellForItemAt(indexPath: IndexPath) -> MoreCellProtocol
}

protocol MoreViewEventSource {
    var title: String { get }
}

protocol MoreViewProtocol: MoreViewDataSource, MoreViewEventSource {
    func didLoad()
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
    
    func didLoad() {
        
    }
    
    
}

// MARK: - DataSource
extension MoreViewModel {
    func cellForItemAt(indexPath: IndexPath) -> MoreCellProtocol {
        return cellItems[indexPath.row]
    }
    
}

// MARK: - DataSource
extension MoreViewModel {
    private func configureCell(cellItem: [GameModel]) {
        
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
        })    }
}
