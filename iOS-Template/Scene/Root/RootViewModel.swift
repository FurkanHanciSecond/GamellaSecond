//
//  RootViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/15/22.
//

import Foundation

protocol RootViewDataSource {}

protocol RootViewEventSource {}

protocol RootViewProtocol: RootViewDataSource, RootViewEventSource {
    func didLoad()
}

final class RootViewModel: BaseViewModel<RootRouter>, RootViewProtocol {
    
    func didLoad() {
        router.loginOnWindow()
        /*
         didload olunca user default kontrolü yapabilirsin ona göre bir ekran açabilirsin.
         istersen api isteği atabilirsin sana kalmış
         bu ekran uygulamada hangi ekranın açılacağının logicini barındırır.
         */
    }
}
