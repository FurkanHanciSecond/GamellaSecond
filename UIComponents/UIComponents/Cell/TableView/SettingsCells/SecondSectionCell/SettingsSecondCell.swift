//
//  SettingsSecondCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints

public protocol SettingsSecondCellDelegate: AnyObject {
    func premiumTapped()
}

public class SettingsSecondCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsSecondCellProtocol?
    public weak var delegate: SettingsSecondCellDelegate?
    
    private let premiumCardView = UIViewBuilder()
        .backgroundColor(AppConstants.Style.Color.gameGray!)
        .cornerRadius(20)
        .shadowRadius(15)
        .build()
    
    private let premiumLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 30, weight: .bold))
        .textColor(AppConstants.Style.Color.white)
        .textAlignment(.center)
        .text("Premium")
        .build()
    
    private let widgetLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .light))
        .textColor(AppConstants.Style.Color.white)
        .textAlignment(.center)
        .text("🚀 Widgets")
        .build()
    
    private let closeAdsLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .light))
        .textColor(AppConstants.Style.Color.white)
        .textAlignment(.center)
        .text("🎉 Close Ads")
        .build()
    
    private let soMuchMoreLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .light))
        .textColor(AppConstants.Style.Color.white)
        .textAlignment(.center)
        .text("😎 So Much More!")
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        let premiumGesture = UITapGestureRecognizer(target: self, action: #selector(premiumTapped(_:)))
        
        premiumCardView.addGestureRecognizer(premiumGesture)
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
        addWidgetLabel()
        addCloseAdsLabel()
        addSoMuchMoreLabel()
    }
    
    private func addPremiumCardView() {
        contentView.addSubview(premiumCardView)
        premiumCardView.edgesToSuperview()
    }
    
    private func addPremiumAppLabel() {
        premiumCardView.addSubview(premiumLabel)
        premiumLabel.edgesToSuperview(excluding: [.bottom], insets: .top(12))
        premiumLabel.centerXToSuperview()
    }
    
    private func addWidgetLabel() {
        contentView.addSubview(widgetLabel)
        widgetLabel.edgesToSuperview(excluding: [.top , .bottom], insets: .left(12))
        widgetLabel.centerYToSuperview()
    }
    
    private func addCloseAdsLabel() {
        contentView.addSubview(closeAdsLabel)
        closeAdsLabel.edgesToSuperview(excluding: [.bottom , .top], insets: .horizontal(12))
        closeAdsLabel.topToBottom(of: widgetLabel , offset: 8)
    }
    
    private func addSoMuchMoreLabel() {
        contentView.addSubview(soMuchMoreLabel)
        soMuchMoreLabel.edgesToSuperview(excluding: [.bottom , .top], insets: .horizontal(12))
        soMuchMoreLabel.topToBottom(of: closeAdsLabel, offset: 8)
    }
    
}

// MARK: - Configgure
extension SettingsSecondCell {
    private func configureContents() {
        premiumCardView.isUserInteractionEnabled = true
    }
}

// MARK: -  Actions
extension SettingsSecondCell {
    
    @objc private func premiumTapped(_ sender: UITapGestureRecognizer) {
        delegate?.premiumTapped()
    }
}
