//
//  SettingsCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public protocol SettingsCellDelegate: AnyObject {
    func feedBackButtonTapped()
    func shareButtonTapped()
    func rateButtonTapped()
}

public class SettingsCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsCellProtocol?
    public weak var delegate: SettingsCellDelegate?
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
        addSubViews()
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
        feedBackButton.edgesToSuperview(excluding: [.top , .bottom])
        feedBackButton.width(345)
        feedBackButton.height(50)
    }
    
    private func addShareButton() {
        contentView.addSubview(shareButton)
        shareButton.edgesToSuperview(excluding: [.top , .bottom])
        shareButton.topToBottom(of: feedBackButton , offset: 16)
        shareButton.width(345)
        shareButton.height(50)
    }
    
    private func addRateButton() {
        contentView.addSubview(rateButton)
        rateButton.edgesToSuperview(excluding: [.top , .bottom])
        rateButton.topToBottom(of: shareButton , offset: 16)
        contentView.trailing(to: rateButton)
        rateButton.width(345)
        rateButton.height(50)
    }
}

// MARK: - Configgure
extension SettingsCell {
    private func configureContents() {
        feedBackButton.addTarget(self, action: #selector(feedBackButtonTapped) , for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        rateButton.addTarget(self, action: #selector(rateButtonTapped), for: .touchUpInside)
    }
}

// MARK: -  Actions
extension SettingsCell {
    
   @objc private func feedBackButtonTapped() {
       delegate?.feedBackButtonTapped()
    }
    
    @objc private func shareButtonTapped() {
        delegate?.shareButtonTapped()
    }
    
    @objc private func rateButtonTapped() {
        delegate?.rateButtonTapped()
    }
}

