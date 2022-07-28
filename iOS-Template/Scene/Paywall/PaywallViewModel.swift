//
//  PaywallViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/21/22.
//

import UIKit
import MobilliumUserDefaults
protocol PaywallViewDataSource {}

protocol PaywallViewEventSource {
    var backgroundColor: UIColor { get }
}

protocol PaywallViewProtocol: PaywallViewDataSource, PaywallViewEventSource {
    func didLoad()
}

final class PaywallViewModel: BaseViewModel<PaywallRouter>, PaywallViewProtocol {
    
    func didLoad() {
        print("didload")
    }
    
    var backgroundColor: UIColor {
        return .systemBackground
    }
    
    func dismissButtonTapped() {
        router.close()
    }
    
    func becomePremiumTapped() {
        DefaultsKey.isPremium.value = true
        router.close()
    }
}
