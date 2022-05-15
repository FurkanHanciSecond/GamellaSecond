//
//  RegisterViewModel.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/15/22.
//

import Foundation

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {}

final class RegisterViewModel: BaseViewModel<RegisterRouter>, RegisterViewProtocol {
    
}
