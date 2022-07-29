//
//  AlreadyPremiumAlert.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/29/22.
//

import UIKit

protocol AlertView {
    func presentAlertView()
}

extension AlertView where Self: RouterProtocol {
    
    func presentAlertView() {
        let transition = ModalTransition()
        
        let alert = UIAlertController(title: "You are already have premium", message: nil, preferredStyle: .actionSheet)
        let unFollowAction = UIAlertAction(title: "Takibi Bırak", style: .default , handler: nil)
        alert.addAction(unFollowAction)
        
        open(alert, transition: transition)
    }
}
