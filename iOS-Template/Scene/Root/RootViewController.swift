//
//  RootViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/15/22.
//

import UIKit

final class RootViewController: BaseViewController<RootViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad()
    }
}
