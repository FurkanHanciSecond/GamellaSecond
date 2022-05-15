//
//  ExampleViewModel.swift
//  iOS-Template
//
//  Created by Ercan Garip on 6.05.2022.
//

import Foundation
import UIComponents

protocol ExampleViewDataSource {
    var numberOfItems: Int { get }
    
    func cellForItemAt(indexPath: IndexPath) -> ExampleCellProtocol
    func didSelectItemAt(indexPath: IndexPath)
}

protocol ExampleViewEventSource {
    var reloadData: VoidClosure? { get set }
}

protocol ExampleViewProtocol: ExampleViewDataSource, ExampleViewEventSource {
    func viewDidLoad()
}

final class ExampleViewModel: BaseViewModel<ExampleRouter>, ExampleViewProtocol {
    
    // Privates
    private var cellItems: [ExampleCellProtocol] = []
    
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
extension ExampleViewModel {
    
    func cellForItemAt(indexPath: IndexPath) -> ExampleCellProtocol {
        return cellItems[indexPath.row]
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        let title = cellItems[indexPath.row].title
        print(title)
    }
}

// MARK: -  Requests
extension ExampleViewModel {
    
    private func getUserList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // Apiyi çağırıyormuşsun gibi algılayalım. ve cellItems içini dolduralım.
            self.cellItems = [
                ExampleCellModel(title: "Birinci Model Uzunnnnnnnnnnn Text"),
                ExampleCellModel(title: " Analytics collection enabled  2022-05-15 22:28:06.388358+0300 iOS-Template[5192:133003] 8.13.0 - [Firebase/Analytics][I-ACS023220] Analytics screen reporting is enabled. Call +[FIRAnalytics logEventWithName:FIREventScreenView parameters:] to log a screen view event. To disable aut"),
                ExampleCellModel(title: "2022-05-15 22:28:06.915299+0300 iOS-Template[5192:133000] [boringssl] boringssl_metrics_log_metric_block_invoke(153) Failed to log metrics"),
                ExampleCellModel(title: "Birinci Modt"),
                ExampleCellModel(title: "BiALKSDJSALKDklsajkldsa")

            ]
            self.reloadData?()
        }
    }
}
