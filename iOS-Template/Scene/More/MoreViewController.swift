//
//  MoreViewController.swift
//  iOS-Template
//
//  Created by Furkan Hanci on 5/29/22.
//

import UIKit

final class MoreViewController: BaseViewController<MoreViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "More"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addBackground(image: UIImage(systemName: "crown.fill")!, opacity: 1, addBlurEffect: true)
    }
    
}
