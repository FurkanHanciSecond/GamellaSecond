//
//  SortViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit

final class SortViewController: BaseViewController<SortViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.title = "Sort"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
