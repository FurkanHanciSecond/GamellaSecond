//
//  PaywallViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/21/22.
//

import Foundation

protocol PaywallViewDataSource {}

protocol PaywallViewEventSource {}

protocol PaywallViewProtocol: PaywallViewDataSource, PaywallViewEventSource {}

final class PaywallViewModel: BaseViewModel<PaywallRouter>, PaywallViewProtocol {
    func dismissButtonTapped() {
        router.close()
    }
}
