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
    
    private let premiumLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 25, weight: .medium))
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
    }
    
    private func addPremiumCardView() {
        contentView.addSubview(premiumCardView)
        premiumCardView.edgesToSuperview()
    }
    
    private func addPremiumAppLabel() {
        premiumCardView.addSubview(appLabel)
        appLabel.edgesToSuperview(excluding: [.bottom, .trailing, .leading], insets: .top(12))
        appLabel.centerXToSuperview()
    }
    
    private func addPremiumLabel() {
        premiumCardView.addSubview(premiumLabel)
        premiumLabel.edgesToSuperview(excluding: [.bottom, .leading, .trailing])
        premiumLabel.leadingToTrailing(of: appLabel , offset: 4)
        premiumLabel.centerY(to: appLabel)
    }
    
}

// MARK: - Configgure
extension SettingsSecondCell {
    private func configureContents() {
        
    }
}
