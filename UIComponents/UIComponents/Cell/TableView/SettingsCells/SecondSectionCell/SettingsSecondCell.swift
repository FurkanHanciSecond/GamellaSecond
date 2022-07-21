//
//  SettingsSecondCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
public class SettingsSecondCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsSecondCellProtocol?
    
    private let premiumCardView = UIViewBuilder()
        .backgroundColor(AppConstants.Style.Color.gameGray!)
        .cornerRadius(20)
        .shadowRadius(15)
        .build()
    
    private let appLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .medium))
        .textColor(.white)
        .textAlignment(.center)
        .text(AppConstants.appName)
        .build()
    
    private let firstTriangleImage = UIImageViewBuilder()
        .tintColor(AppConstants.Style.Color.labelColor)
        .size(.init(width: 25, height: 25))
        .image(UIImage(systemName: "triangle")!)
        .build()
    
    private let secondTriangleImage = UIImageViewBuilder()
        .tintColor(AppConstants.Style.Color.labelColor)
        .size(.init(width: 25, height: 25))
        .image(UIImage(systemName: "triangle")!)
        .build()
    
    private let thirdTriangleImage = UIImageViewBuilder()
        .tintColor(AppConstants.Style.Color.labelColor)
        .size(.init(width: 25, height: 25))
        .image(UIImage(systemName: "triangle")!)
        .build()
    
    private let premiumLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .light))
        .textColor(AppConstants.Style.Color.gameLinOrange!)
        .textAlignment(.center)
        .text("Premium")
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureContents()
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: SettingsSecondCellProtocol) {
        self.viewModel = viewModel
    }
    
}


// MARK: -  UILayout
extension SettingsSecondCell {
    private func addSubViews() {
        addPremiumCardView()
        addPremiumAppLabel()
        addPremiumLabel()
       // addFirstTriangle()
        addSecondTriangle()
    }
    
    private func addPremiumCardView() {
        contentView.addSubview(premiumCardView)
        premiumCardView.edgesToSuperview()
    }
    
    private func addPremiumAppLabel() {
        premiumCardView.addSubview(appLabel)
        appLabel.edgesToSuperview(excluding: [.bottom, .trailing, .leading], insets: .top(12))
        appLabel.centerXToSuperview(offset: -48)
    }
    
    private func addPremiumLabel() {
        premiumCardView.addSubview(premiumLabel)
        premiumLabel.edgesToSuperview(excluding: [.bottom, .leading, .trailing])
        premiumLabel.leadingToTrailing(of: appLabel , offset: 8)
        premiumLabel.centerY(to: appLabel)
    }
    
    private func addFirstTriangle() {
        premiumCardView.addSubview(firstTriangleImage)
        firstTriangleImage.edgesToSuperview(excluding: [.trailing , .top], insets: .horizontal(16) + .vertical(64))
    }
    
    private func addSecondTriangle() {
        let views = [firstTriangleImage , secondTriangleImage , thirdTriangleImage]
        //premiumCardView.addSubviews(views)
        premiumCardView.stack(views, axis: .vertical, width: 10, height: 10, spacing: 0)
//        premiumCardView.addSubview(secondTriangleImage)
//        secondTriangleImage.edgesToSuperview(excluding: [.trailing , .top], insets: .horizontal(16))
//        secondTriangleImage.topToBottom(of: firstTriangleImage)
    }
    
}

// MARK: - Configgure
extension SettingsSecondCell {
    private func configureContents() {
        
    }
}
