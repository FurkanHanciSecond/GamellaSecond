//
//  NotPremiumViewModel.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/27/22.
//

import Foundation

protocol NotPremiumViewDataSource {}

protocol NotPremiumViewEventSource {}

protocol NotPremiumViewProtocol: NotPremiumViewDataSource, NotPremiumViewEventSource {}

final class NotPremiumViewModel: BaseViewModel<NotPremiumRouter>, NotPremiumViewProtocol {
    
}
