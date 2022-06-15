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
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get set }
    var title: String { get }
    var backgroundColor : UIColor { get }
}

protocol HomeViewProtocol: HomeViewDataSource , HomeViewEventSource {
    func viewDidLoad()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var backgroundColor: UIColor {
        return AppConstants.Style.Color.systemBackground
    }
    
    var title: String {
        return "Hello \(DefaultsKey.userName.value ?? "")"
    }
    
    // Privates
    private var cellItems: [HomeCellProtocol] = []
    
    // DataSource
    var numberOfItems: Int {
        return cellItems.count
    }
    
    // EventSource
    var reloadData: VoidClosure?
    
    func viewDidLoad() {
        getUserList(platfrom: "pc")
    }
}

// MARK: - DataSource
extension HomeViewModel {
    
    func cellForItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let title = cellItems[indexPath.row].title
        print(title)
    }
}

// MARK: - DataSource
extension HomeViewModel {
    
    private func configutreCell(cellItem: [GameModel]) {
        let item = cellItem.map({ HomeCellModel(title: $0.title ?? "", priceLabel: $0.worth ?? "", statusLabel: $0.status?.rawValue ?? "Error", deadLineLabel: $0.endDate ?? "" , typeLabel: $0.type?.rawValue ?? "Error", imageData: $0.thumbnail ?? "") })
        cellItems = item
        reloadData?()
    }
}

// MARK: -  Requests
extension HomeViewModel {
    
    private func getUserList(platfrom: String) {
        showLoading?()
        let request = GameDataRequest(platform: platfrom)
        dataProvider?.request(for: request, result: { [weak self] data in
            guard let self = self else { return }
            switch data {
            case .failure(let error):
                print(error.localizedDescription)
                self.showLoading?()
                
                
            case .success(let response):
                self.configutreCell(cellItem: response)
                self.hideLoading?()
            }
        })
        self.reloadData?()
    }
}
