//
//  SortDetailViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/20/22.
//

import UIKit
import MobilliumBuilders
final class SortDetailViewController: BaseViewController<SortDetailViewModel> {
    
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
