//
//  HomeDetailViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import Kingfisher
final class HomeDetailViewController: BaseViewController<HomeDetailViewModel> {
    
    private let detailImage = UIImageViewBuilder()
        .size(CGSize(width: UIScreen.main.bounds.size.width, height: 210))
        .cornerRadius(35)
        .build()
    
    private let detailUIView = UIViewBuilder()
        .backgroundColor(AppConstants.Style.Color.orange!)
        .cornerRadius(15)
        .build()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureContents()
        addSubViews()
        
    }
}

// MARK: - UILayout
extension HomeDetailViewController {
    
    private func addSubViews() {
       addDetailImage()
        addDetailImage()
        addDetailView()
    }
    
    private func addDetailImage() {
        view.addSubview(detailImage)
        detailImage.topToSuperview(view.safeAreaLayoutGuide.topAnchor , offset: -32)
    }
    
    private func addDetailView() {
        view.addSubview(detailUIView)
        detailUIView.addBorder()
        detailUIView.topToBottom(of: detailImage , offset: 32)
        detailUIView.size(CGSize(width: UIScreen.main.bounds.size.width, height: 150))
    }
    
    private func configureDetailViewElements() {
        
    }
    
}

// MARK: - ConfigureContents
extension HomeDetailViewController {
    private func configureContents() {
        addBarButton()
        configureDetailElements()
    }
    
    private func addBarButton() {
        let navBarButton = UIBarButtonItem(image: AppConstants.Style.Image.upload, style: .plain, target: self, action: #selector(shareButtonHandle(_:)))
        navBarButton.tintColor = AppConstants.Style.Color.labelColor
        self.navigationItem.rightBarButtonItem = navBarButton
    }
    
    private func configureDetailElements() {
        let imageUrl = URL(string: viewModel.model.image ?? "")
        detailImage.kf.setImage(with: imageUrl  ,options: [.scaleFactor(UIScreen.main.scale), .transition(.fade(1))])
        
    }
}

// MARK: - Actions
extension HomeDetailViewController {
    @objc private func shareButtonHandle(_ sender: UIBarButtonItem) {
        viewModel.shareButtonTapped()
    }
}
