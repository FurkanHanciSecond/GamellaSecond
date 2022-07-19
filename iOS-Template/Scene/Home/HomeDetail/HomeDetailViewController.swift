//
//  HomeDetailViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
final class HomeDetailViewController: BaseViewController<HomeDetailViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureContents()
        
    }
}

// MARK: - UILayout
extension HomeDetailViewController {
    
    private func addSubViews() {
       
    }
    
}

// MARK: - ConfigureContents
extension HomeDetailViewController {
    private func configureContents() {
        addBarButton()
    }
    
    private func addBarButton() {
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.upload, style: .plain, target: self, action: #selector(shareButtonHandle(_:)))
        navBarButton.tintColor = AppConstants.Style.Color.labelColor
        self.navigationItem.rightBarButtonItem = navBarButton
    }
}

// MARK: - Actions
extension HomeDetailViewController {
    @objc private func shareButtonHandle(_ sender: UIBarButtonItem) {
        viewModel.shareButtonTapped()
    }
}
