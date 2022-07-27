//
//  NotPremiumViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/27/22.
//

import Foundation
import MobilliumUserDefaults
protocol NotPremiumViewDataSource {}

protocol NotPremiumViewEventSource {}

protocol NotPremiumViewProtocol: NotPremiumViewDataSource, NotPremiumViewEventSource {}

final class NotPremiumViewModel: BaseViewModel<NotPremiumRouter>, NotPremiumViewProtocol {
    
    func checkPremium() {
        if let isPremium = DefaultsKey.isPremium.value {
            if isPremium {
                router.close()
            }
        }
    }
}
