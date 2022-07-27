//
//  PaywallViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/21/22.
//

import UIKit

protocol PaywallViewDataSource {}

protocol PaywallViewEventSource {
    var backgroundColor: UIColor { get }
}

protocol PaywallViewProtocol: PaywallViewDataSource, PaywallViewEventSource {}

final class PaywallViewModel: BaseViewModel<PaywallRouter>, PaywallViewProtocol {
    
    var backgroundColor: UIColor {
        return .systemBackground
    }
    
    func dismissButtonTapped() {
        router.close()
    }
}
