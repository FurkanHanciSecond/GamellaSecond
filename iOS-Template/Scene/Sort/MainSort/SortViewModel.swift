//
//  SortViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import Foundation
import UIKit
import UIComponents
import Utilities

protocol SortViewDataSource {
    var numberOfItems: Int { get }
    
    func cellForItemAt(indexPath: IndexPath) -> SortCellProtocol
    func didSelectItemAt(indexPath: IndexPath)
}

protocol SortViewEventSource {
   var title: String { get }
    var backgroundColor: UIColor { get }
    var reloadData: VoidClosure? { get set }
}
protocol SortViewProtocol: SortViewDataSource, SortViewEventSource {
    func didload()
}

final class SortViewModel: BaseViewModel<SortRouter>, SortViewProtocol {
    
    private var cellItems: [SortCellProtocol] = []
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func didload() {
        getSortByData(platfrom: "pc" , type: "game" , sortBy: "price")
    }
    
    var reloadData: VoidClosure?
    
    var title: String {
        return "Sort Games"
    }
    
    var backgroundColor: UIColor {
        return AppConstants.Style.Color.systemBackground
    }
    
}

// MARK: - DataSource
extension SortViewModel {
    
    func cellForItemAt(indexPath: IndexPath) -> SortCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let title = cellItems[indexPath.row].title
        print(title)
        router.pushSortDetail()
    }
}

// MARK: - DataSource
extension SortViewModel {
    private func configureCellItems(cellItem : [GameModel]) {
        let item = cellItem.map({ SortCellModel(title: $0.title ?? "", priceLabel: $0.worth ?? "", statusLabel: $0.status?.rawValue ?? "", deadLineLabel: $0.endDate ?? "", typeLabel: $0.type?.rawValue ?? "", imageData: $0.thumbnail ?? "")})
        cellItems = item
        reloadData?()
    }
}

// MARK: - Requests
extension SortViewModel {
    private func getSortByData(platfrom: String , type: String , sortBy : String) {
        showLoading?()
        let request = SortDataRequest(platform: platfrom , type: type , sortBy: sortBy)
        dataProvider?.request(for: request, result: { [weak self] gameData in
            guard let self = self else { return }
            switch gameData {
            case .failure(let error):
                print(error.localizedDescription)
                self.showLoading?()


            case .success(let response):
                self.configureCellItems(cellItem: response)
                self.hideLoading?()
            }
        })
        self.reloadData?()
    }
}
