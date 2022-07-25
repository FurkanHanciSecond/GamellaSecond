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
import BLTNBoard
final class HomeDetailViewController: BaseViewController<HomeDetailViewModel> {
    
    lazy var bulletinManager: BLTNItemManager = {
        let introPage = BulletinDataSource.makePremiumDeal()
           return BLTNItemManager(rootItem: introPage)
       }()
    
    
    private let detailImage = UIImageViewBuilder()
        .size(CGSize(width: UIScreen.main.bounds.size.width, height: 210))
        .cornerRadius(20)
        .clipsToBounds(true)
        .build()
    
    private let detailUIView = UIViewBuilder()
        .backgroundColor(AppConstants.Style.Color.orange!)
        .cornerRadius(15)
        .build()
    
    private let detailUIViewText = UILabelBuilder()
        .numberOfLines(0)
        .textAlignment(.center)
        .textColor(.black)
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
        configureContents()
        addSubViews()
        viewModel.presentPaywall()
        
    }
}

// MARK: - UILayout
extension HomeDetailViewController {
    
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
        detailUIView.size(CGSize(width: UIScreen.main.bounds.size.width / 1.3, height: 170))
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
extension HomeDetailViewController {
    private func configureContents() {
        view.backgroundColor = .systemBackground
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
        detailUIViewText.text = viewModel.model.welcomeDescription
        detailButton.addTarget(self, action: #selector(getLinkButtonHandle(_:)), for: .touchUpInside)
    }
}

// MARK: - Actions
extension HomeDetailViewController {
    @objc private func shareButtonHandle(_ sender: UIBarButtonItem) {
        viewModel.shareButtonTapped()
    }
    
    @objc private func getLinkButtonHandle(_ sender: UIButton) {
        viewModel.presentSafariButtonTapped()
    }
}
