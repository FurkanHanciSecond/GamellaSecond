//
//  MoreDetailViewController.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/24/22.
//

import UIKit
import MobilliumBuilders
import Kingfisher
import TinyConstraints
final class MoreDetailViewController: BaseViewController<MoreDetailViewModel> {
    
    private let detailImage = UIImageViewBuilder()
        .size(CGSize(width: UIScreen.main.bounds.size.width, height: 210))
        .cornerRadius(20)
        .clipsToBounds(true)
        .build()
    
    private let detailUIView = UIViewBuilder()
        .backgroundColor(AppConstants.Style.Color.gameLinOrange!)
        .cornerRadius(15)
        .build()
    
    private let detailUIViewText = UILabelBuilder()
        .numberOfLines(0)
        .textAlignment(.center)
        .textColor(.white)
        .build()
    
    private let detailButton = UIButtonBuilder()
        .cornerRadius(15)
        .title(AppConstants.Texts.Button.getLink)
        .titleFont(.systemFont(ofSize: 20, weight: .bold))
        .backgroundColor(AppConstants.Style.Color.gameDarkBlue!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureContents()
        addSubViews()
        
    }
}

// MARK: - UILayout
extension MoreDetailViewController {
    
    private func addSubViews() {
       addDetailImage()
        addDetailImage()
        addDetailView()
        configureDetailViewElements()
        addDetailButton()
        
    }
    
    private func addDetailImage() {
        view.addSubview(detailImage)
        detailImage.topToSuperview(view.safeAreaLayoutGuide.topAnchor , offset: -32)
    }
    
    private func addDetailView() {
        view.addSubview(detailUIView)
        detailUIView.topToBottom(of: detailImage , offset: 32)
        detailUIView.centerXToSuperview()
        detailUIView.size(CGSize(width: UIScreen.main.bounds.size.width / 1.1 , height: 175))
    }
    
    private func addDetailButton() {
        view.addSubview(detailButton)
        detailButton.topToBottom(of: detailUIView , offset: 24)
        detailButton.centerXToSuperview()
        detailButton.width(200)
        detailButton.height(50)
    }
    
    private func configureDetailViewElements() {
        detailUIView.addSubview(detailUIViewText)
        detailUIViewText.edgesToSuperview()
    }
    
}

// MARK: - ConfigureContents
extension MoreDetailViewController {
    private func configureContents() {
        configureDetailElements()
    }
    private func configureDetailElements() {
        let imageUrl = URL(string: viewModel.model.image ?? "")
        detailImage.kf.setImage(with: imageUrl  ,options: [.scaleFactor(UIScreen.main.scale), .transition(.fade(1))])
        detailUIViewText.text = viewModel.model.welcomeDescription
        detailButton.addTarget(self, action: #selector(getLinkButtonHandle(_:)), for: .touchUpInside)
    }
}

// MARK: - Actions
extension MoreDetailViewController {
    @objc private func getLinkButtonHandle(_ sender: UIButton) {
        viewModel.presentSafariButtonTapped()
    }
}

