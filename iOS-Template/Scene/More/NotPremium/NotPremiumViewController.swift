//
//  NotPremiumViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/27/22.
//

import UIKit

final class NotPremiumViewController: BaseViewController<NotPremiumViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Not premium"
    }
    
}
