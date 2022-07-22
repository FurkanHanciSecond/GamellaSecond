//
//  SettingsThirdCellCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
public class SettingsThirdCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsThirdCellProtocol?
    
    private let activeGiveawayLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 20, weight: .regular))
        .textColor(AppConstants.Style.Color.labelColor)
        .numberOfLines(0)
        .build()
    
    private let totalWorthLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 20, weight: .semibold))
        .textColor(AppConstants.Style.Color.labelColor)
        .numberOfLines(0)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: SettingsThirdCellProtocol?) {
        self.viewModel = viewModel
        configureContents()
        
    }
    
}

// MARK: - UILayour
extension SettingsThirdCell {
    private func addSubViews() {
        addTotalWorthLabel()
        addActiveGiveAwayLabel()
    }
    
    private func addTotalWorthLabel() {
        contentView.addSubview(totalWorthLabel)
        totalWorthLabel.edgesToSuperview(excluding: .bottom, insets: .top(24))
    }
    
    private func addActiveGiveAwayLabel() {
        contentView.addSubview(activeGiveawayLabel)
        activeGiveawayLabel.topToBottom(of: totalWorthLabel , offset: 4)
    }
}

// MARK: - Configure
extension SettingsThirdCell {
    
    private func configureContents() {
        totalWorthLabel.text = "Worth Estimation (USD): " + (viewModel?.totalGiveAwaysWorth ?? "")
        activeGiveawayLabel.text = "Total Giveaways = \(viewModel?.activeGiveAways ?? 0)"
    }
}
