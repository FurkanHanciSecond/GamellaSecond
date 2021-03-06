//
//  HomeViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation
import UIComponents
import MobilliumUserDefaults
protocol HomeViewDataSource {
    var numberOfItems: Int { get }
    
    func cellForItemAt(indexPath: IndexPath) -> HomeCellProtocol
    func didSelectItemAt(indexPath: IndexPath)
    func didSelectPopItemAt(platform: String)
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get set }
    var title: String { get }
    var backgroundColor : UIColor { get }
}

protocol HomeViewProtocol: HomeViewDataSource , HomeViewEventSource {
    func viewDidLoad()
    func refreshData()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    func didSelectPopItemAt(platform: String) {
        getGameData(platfrom: platform, type: "game", sortBy: "popluarity")
    }
    
    var backgroundColor: UIColor {
        return AppConstants.Style.Color.systemBackground
    }
    
    var title: String {
        return "Hello \(DefaultsKey.userName.value ?? "")"
    }
    
    // Privates
     var model : [GameModel] = []
     var cellItems: [HomeCellProtocol] = []
    
    // DataSource
    var numberOfItems: Int {
        return cellItems.count
    }
    
    // EventSource
    var reloadData: VoidClosure?
    
    func viewDidLoad() {
        getGameData(platfrom: "pc" , type: "game" , sortBy: "popularity")
    }
    
    func refreshData() {
        getGameData(platfrom: "pc", type: "game", sortBy: "popularity")
    }
}

// MARK: - DataSource
extension HomeViewModel {
    
    func cellForItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let index = cellItems[indexPath.row].title
        router.pushHomeDetail(model: model[indexPath.row])
    }
}

// MARK: - DataSource
extension HomeViewModel {
    
    private func configutreCell(cellItem: [GameModel]) {
        let item = cellItem.map({ HomeCellModel(title: $0.title ?? "", priceLabel: $0.worth ?? "", statusLabel: $0.status?.rawValue ?? "Error", deadLineLabel: $0.endDate ?? "" , typeLabel: $0.type?.rawValue ?? "Error", imageData: $0.thumbnail ?? "") })
        cellItems = item
       // reloadData?()
    }
}

// MARK: -  Requests
extension HomeViewModel {
    
    private func getGameData(platfrom: String , type: String , sortBy : String) {
        showLoading?()
        let request = GameDataRequest(platform: platfrom , type: type , sortBy: sortBy)
        dataProvider?.request(for: request, result: { [weak self] data in
            guard let self = self else { return }
            switch data {
            case .failure(let error):
                print(error.localizedDescription)
                EntryKitHelper.show("Error!", additionalMessage: "No active giveaways available at the moment, please try again later", type: .error, statusBar: .ignored)
                
                
            case .success(let response):
                self.model = response
                self.configutreCell(cellItem: response)
                self.hideLoading?()
                self.reloadData?()
            }
        })
        
      
    }
}
