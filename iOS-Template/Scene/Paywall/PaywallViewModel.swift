//
//  PaywallViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/21/22.
//

import UIKit
import MobilliumUserDefaults

protocol PaywallViewModelDelegate {
    func dismissButtonTapped()
    func becomePremiumTapped()
}

protocol PaywallViewDataSource {}

protocol PaywallViewEventSource {
    var backgroundColor: UIColor { get }
}

protocol PaywallViewProtocol: PaywallViewDataSource, PaywallViewEventSource {
    func didLoad()
}

final class PaywallViewModel: BaseViewModel<PaywallRouter>, PaywallViewProtocol , PaywallViewModelDelegate {
    
    func didLoad() {
        print("didload")
    }
    
    var backgroundColor: UIColor {
        return .systemBackground
    }
}

// MARK: - Actions
extension PaywallViewModel {
    func dismissButtonTapped() {
        router.close()
    }
    
    func becomePremiumTapped() {
        AppGroupDefaults.shared.becomePremium()
        DefaultsKey.isPremium.value = true
        router.close()
    }
}
