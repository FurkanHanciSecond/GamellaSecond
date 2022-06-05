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
}

protocol HomeViewProtocol: HomeViewDataSource , HomeViewEventSource {
    func viewDidLoad()
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
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
        getUserList()
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
        showLoading?()
        let request = GameDataRequest()
        dataProvider?.request(for: request, result: { data in
            switch data {
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let response):
                print(response)
            }
        })
        DispatchQueue.main.async {
            // Apiyi çağırıyormuşsun gibi algılayalım. ve cellItems içini dolduralım.
//            self.cellItems = [
//                HomeCellModel(title: "Birinci Model Uzunnnnnnnnnnn Text"),
//                HomeCellModel(title: " Analytics collection enabled  2022-05-15 22:28:06.388358+0300 iOS-Template[5192:133003] 8.13.0 - [Firebase/Analytics][I-ACS023220] Analytics screen reporting is enabled. Call +[FIRAnalytics logEventWithName:FIREventScreenView parameters:] to log a screen view event. To disable aut"),
//                HomeCellModel(title: "2022-05-15 22:28:06.915299+0300 iOS-Template[5192:133000] [boringssl] boringssl_metrics_log_metric_block_invoke(153) Failed to log metrics"),
//                HomeCellModel(title: "Birinci Modt"),
//                HomeCellModel(title: "BiALKSDJSALKDklsajkldsa")
//
//            ]
            
            self.reloadData?()
        }
    }
}
