//
//  PaywallViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/21/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
final class PaywallViewController: BaseViewController<PaywallViewModel> {
    
    private let premiumTestLabel = UILabelBuilder()
        .text("Paywall AMK")
        .textColor(.white)
        .font(.systemFont(ofSize: 20, weight: .semibold))
        .build()
    
    private let detailButton = UIButtonBuilder()
        .cornerRadius(15)
        .title(AppConstants.Texts.Button.getLink)
        .titleFont(.systemFont(ofSize: 20, weight: .bold))
        .backgroundColor(AppConstants.Style.Color.purple!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubviews(premiumTestLabel , detailButton)
        //premiumTestLabel.centerInSuperview()
        detailButton.centerInSuperview()
        
        detailButton.addTarget(self, action: #selector(handel), for: .touchUpInside)
    }
    @objc private func handel() {
        viewModel.dismissButtonTapped()
    }
    
}
