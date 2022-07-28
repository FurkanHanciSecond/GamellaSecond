//
//  PaywallViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/21/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import MobilliumUserDefaults
final class PaywallViewController: BaseViewController<PaywallViewModel> {
    
    private let premiumTestLabel = UILabelBuilder()
        .text("Paywall AMK")
        .textColor(.white)
        .font(.systemFont(ofSize: 20, weight: .semibold))
        .build()
    
    private let detailButton = UIButtonBuilder()
        .cornerRadius(15)
        .title("Become Premium")
        .titleFont(.systemFont(ofSize: 20, weight: .bold))
        .backgroundColor(AppConstants.Style.Color.purple!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        addSubViews()
        addNavBar()
        
        detailButton.addTarget(self, action: #selector(becomePremium), for: .touchUpInside)
    }
    
}

// MARK: - UILayout
extension PaywallViewController {
    
    private func addSubViews() {
        addDetailButton()
    }
    
    private func addDetailButton() {
        view.addSubview(detailButton)
        detailButton.edgesToSuperview(insets: .horizontal(12) + .vertical(12))
    }
    
    private func addNavBar() {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: UIScreen.main.bounds.minY + 15, width: view.frame.size.width, height: 44))
        navBar.tintColor = .black
        navBar.barTintColor = .black
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Gamella Premium 👑")
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.xMark, style: .plain, target: self, action: #selector(handel))
        navItem.rightBarButtonItem = navBarButton

        navBar.setItems([navItem], animated: true)
    }
}

// MARK: - Configure
extension PaywallViewController {
    private func configureContents() {
        view.backgroundColor = viewModel.backgroundColor
    }
}

// MARK: - Actions
extension PaywallViewController {
    @objc private func handel() {
        viewModel.dismissButtonTapped()
    }
    
    @objc private func becomePremium() {
        viewModel.becomePremiumTapped()
    }
}
