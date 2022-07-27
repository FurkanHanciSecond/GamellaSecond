//
//  NotPremiumViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/27/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
final class NotPremiumViewController: BaseViewController<NotPremiumViewModel> {
    
    private let continueButton = UIButtonBuilder()
        .cornerRadius(15)
        .title(AppConstants.Texts.Button.onboardButtonText)
        .titleFont(.systemFont(ofSize: 20))
        .backgroundColor(AppConstants.Style.Color.indigo!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.navigationItem.setHidesBackButton(true, animated: true)
        view.addSubview(continueButton)
        continueButton.edgesToSuperview(insets: .horizontal(16) + .vertical(16))
        continueButton.addTarget(self, action: #selector(handle), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.checkPremium()
    }
    
    @objc private func handle() {
        viewModel.router.presentPaywall()
    }
    
}
