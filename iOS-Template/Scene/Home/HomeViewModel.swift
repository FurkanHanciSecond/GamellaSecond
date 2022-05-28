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
    var numberOfItems : Int { get }
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func didload()
}
final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    var numberOfItems: Int {
        cellItems.count
    }
    
    private var cellItems: [HomeCellProtocol] = []

    
    var reloadData: VoidClosure?
    
    func didload() {
        print("Home didLoad")
    }
    
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        return cellItems[indexPath.row]
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

// MARK: -  Requests
extension HomeViewModel {
    
    private func getUserList() {
        DispatchQueue.main.async {
            // Apiyi çağırıyormuşsun gibi algılayalım. ve cellItems içini dolduralım.
            self.cellItems = [
                HomeCellModel(title: "Birinci Model Uzunnnnnnnnnnn Text"),
                HomeCellModel(title: " Analytics collection enabled  2022-05-15 22:28:06.388358+0300 iOS-Template[5192:133003] 8.13.0 - [Firebase/Analytics][I-ACS023220] Analytics screen reporting is enabled. Call +[FIRAnalytics logEventWithName:FIREventScreenView parameters:] to log a screen view event. To disable aut"),
                HomeCellModel(title: "2022-05-15 22:28:06.915299+0300 iOS-Template[5192:133000] [boringssl] boringssl_metrics_log_metric_block_invoke(153) Failed to log metrics"),
                HomeCellModel(title: "Birinci Modt"),
                HomeCellModel(title: "BiALKSDJSALKDklsajkldsa")

            ]
            self.reloadData?()
        }
    }
}
