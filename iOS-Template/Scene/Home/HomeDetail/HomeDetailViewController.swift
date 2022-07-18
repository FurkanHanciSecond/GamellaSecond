//
//  HomeDetailViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import DataProvider
final class HomeDetailViewController: BaseViewController<HomeDetailViewModel> {
    
    private let testLabel = UILabelBuilder()
        .textColor(.black)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(testLabel)
        testLabel.edgesToSuperview()
        testLabel.text = viewModel.model.title
        
    }
    

}
