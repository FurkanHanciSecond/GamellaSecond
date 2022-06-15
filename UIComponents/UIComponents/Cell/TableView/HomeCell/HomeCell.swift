//
//  HomeCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/22/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
import Kingfisher

public class HomeCell: UITableViewCell, ReusableView {
    weak var viewModel: HomeCellProtocol?
    
    private let verticalPadding: CGFloat = 10
    private let horizontalPadding : CGFloat = 20
    
    private let titleLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 18 , weight: .semibold))
        .textColor(AppConstants.Style.Color.black)
        .numberOfLines(0)
        .build()
    
    private let priceLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 15, weight: .bold))
        .textColor(AppConstants.Style.Color.black)
        .numberOfLines(0)
        .build()
    
    private let statusLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 13, weight: .regular))
        .textColor(AppConstants.Style.Color.black)
        .numberOfLines(0)
        .build()
    
    private let endDateLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 13, weight: .light))
        .textColor(AppConstants.Style.Color.black)
        .numberOfLines(0)
        .build()
    
    private let typeLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 13, weight: .medium))
        .textColor(AppConstants.Style.Color.black)
        .numberOfLines(0)
        .build()
    
    private let gameImage = UIImageViewBuilder()
        .tintColor(AppConstants.Style.Color.black)
        .contentMode(.scaleAspectFit)
        .build()
    
    private let arrowRightImage = UIImageViewBuilder()
        .tintColor(AppConstants.Style.Color.labelColor)
        .size(.init(width: 30, height: 30))
        .image(UIImage(systemName: "chevron.forward")!)
        .build()
    
    private lazy var containerView = UIViewBuilder()
        .backgroundColor(AppConstants.Style.Color.lightPurple ?? .blue)
         .shadowColor(AppConstants.Style.Color.lightOrange!.cgColor)
        .shadowRadius(20)
        .shadowOpacity(0.6)
        .shadowOffset(CGSize(width: 0, height: 3))
        .cornerRadius(contentView.frame.height / 2)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func set(viewModel: HomeCellProtocol?) {
        self.viewModel = viewModel
        self.configureContents()
    }
}

// MARK: -  UILayout
extension HomeCell {
 
    private func addSubViews() {
        addContainerView()
        addTitleLabel()
        addPriceLabel()
        addStatusLabel()
        addEndDateLabel()
        addTypeLabel()
        addGameImage()
        addRightArrow()
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        containerView.leadingToSuperview(offset: horizontalPadding)
        containerView.trailingToSuperview(offset: horizontalPadding)
        containerView.bottomToSuperview()
        containerView.topToSuperview(offset: verticalPadding)
    }
    
    private func addTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(excluding: [.bottom , .leading], insets: .horizontal(8) + .vertical(16))
    }
    
    private func addPriceLabel() {
        containerView.addSubview(priceLabel)
        priceLabel.edgesToSuperview(excluding: [.top, .bottom , .leading], insets: .horizontal(16) + .bottom(8))
        priceLabel.topToBottom(of: titleLabel, offset: 8)
        priceLabel.leading(to: titleLabel)
    }
    
    private func addStatusLabel() {
        containerView.addSubview(statusLabel)
        statusLabel.edgesToSuperview(excluding: [.top , .bottom , .leading], insets: .horizontal(16) + .bottom(16))
        statusLabel.topToBottom(of: priceLabel, offset: 8)
        statusLabel.leading(to: priceLabel)
    }
    
    private func addEndDateLabel() {
        containerView.addSubview(endDateLabel)
        endDateLabel.edgesToSuperview(excluding: [.top , .bottom , .leading] , insets: .horizontal(16) + .bottom(16))
        endDateLabel.topToBottom(of: statusLabel , offset: 8)
        endDateLabel.leading(to: statusLabel)
    }
    
    private func addTypeLabel() {
        containerView.addSubview(typeLabel)
        typeLabel.edgesToSuperview(excluding: [.top , .leading], insets: .horizontal(16) + .bottom(16))
        typeLabel.topToBottom(of: endDateLabel , offset: 8)
        typeLabel.leading(to: endDateLabel)
    }
    
    private func addGameImage() {
        containerView.addSubview(gameImage)
        gameImage.edgesToSuperview(excluding: [.bottom , .trailing] , insets: .horizontal(16) + .vertical(32))
        gameImage.trailingToLeading(of: titleLabel , offset: -24)
        gameImage.height(100)
        gameImage.width(100)
    }
    
    private func addRightArrow() {
        containerView.addSubview(arrowRightImage)
        arrowRightImage.edgesToSuperview(excluding: [.leading , .top], insets: .horizontal(16) + .vertical(64))
    }
}
// MARK: -  Configure
extension HomeCell {
    
    private func configureContents() {
        
        let imageUrl = URL(string: viewModel?.image ?? "")
        let processor = DownsamplingImageProcessor(size: CGSize(width: 300, height: 300))
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        gameImage.kf.indicatorType = .activity
        gameImage.kf.setImage(
            with: imageUrl,
            placeholder: UIImage(systemName: "bolt.circle.fill"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        titleLabel.text = viewModel?.title
        priceLabel.text = "Price: \(viewModel?.priceLabel ?? "")"
        statusLabel.text = "Status: \(viewModel?.statusLabel ?? "")"
        endDateLabel.text = "EndDate: \(viewModel?.deadLineLabel ?? "")"
        typeLabel.text = "Type: \(viewModel?.typeLabel ?? "")"
    }
}
