//
//  SettingsCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
public class SettingsCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsCellProtocol?
    private let verticalPadding: CGFloat = 10
    private let horizontalPadding : CGFloat = 20
    
    private let feedBackButton = UIButtonBuilder()
        .cornerRadius(15)
        .title(AppConstants.Texts.Button.feedBack)
        .titleFont(.systemFont(ofSize: 25, weight: .medium))
        .backgroundColor(AppConstants.Style.Color.indigo!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    private let shareButton = UIButtonBuilder()
        .cornerRadius(15)
        .title(AppConstants.Texts.Button.share)
        .titleFont(.systemFont(ofSize: 25, weight: .medium))
        .backgroundColor(AppConstants.Style.Color.indigo!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    private let rateButton = UIButtonBuilder()
        .cornerRadius(15)
        .title(AppConstants.Texts.Button.rate)
        .titleFont(.systemFont(ofSize: 25, weight: .medium))
        .backgroundColor(AppConstants.Style.Color.indigo!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
        selectionStyle = .none
        //addSubViews()
        //contentView.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: SettingsCellProtocol) {
        self.viewModel = viewModel
    }
    
}


// MARK: -  UILayout
extension SettingsCell {
    private func addSubViews() {
        addFeedBackButton()
        addShareButton()
        addRateButton()
    }
    
    private func addFeedBackButton() {
        contentView.addSubview(feedBackButton)
        feedBackButton.edgesToSuperview()
        feedBackButton.width(345)
        feedBackButton.height(50)
    }
    
    private func addShareButton() {
        contentView.addSubview(shareButton)
        shareButton.topToBottom(of: feedBackButton , offset: 4)
        shareButton.width(345)
        shareButton.height(50)
    }
    
    private func addRateButton() {
        contentView.addSubview(rateButton)
        rateButton.topToBottom(of: shareButton , offset: 4)
        rateButton.width(345)
        rateButton.height(50)
    }
}

// MARK: - Configgure
extension SettingsCell {
    private func configureContents() {
        
    }
}

