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
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func didload() {
        print("sort didload")
        configureCellItems()
    }
    
    private var cellItems: [SortCellProtocol] = []
    
    var reloadData: VoidClosure?
    
    var title: String {
        return "Sort Games"
    }
    
    var backgroundColor: UIColor {
        return AppConstants.Style.Color.labelColor
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
    }
}

// MARK: - Configure
extension SortViewModel {
    private func configureCellItems() {
        cellItems = [
          SortCellModel(title: "WJDHVFEJDV 1.TITLE"),
          SortCellModel(title: "WEFKJBVFKJV UZUUUNNNNTEXTTTTTTWEFKJBVFKJV UZUUUNNNNTEXTTTTTTWEFKJBVFKJV UZUUUNNNNTEXTTTTTTWEFKJBVFKJV UZUUUNNNNTEXTTTTTTWEFKJBVFKJV UZUUUNNNNTEXTTTTTTWEFKJBVFKJV UZUUUNNNNTEXTTTTTT"),
          SortCellModel(title: "WJDHVFEJDV 2.TITLE"),
          SortCellModel(title: "WJDHVFEJDV 3.TITLE"),
          SortCellModel(title: "WJDHVFEJDV 4.CELLL UZUUUUNNNN TITILEEEEE"),
          SortCellModel(title: "WJDHVFEJDV 5.TITLE UZUUUNNNNNN MODEL CELLLL"),

        ]
    }
}
