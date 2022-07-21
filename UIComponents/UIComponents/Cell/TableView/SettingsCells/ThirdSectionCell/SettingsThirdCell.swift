//
//  SettingsThirdCellCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit
import MobilliumBuilders

public class SettingsThirdCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsThirdCellProtocol?
    
    private let activeGiveawayLabel = UILabelBuilder()
        .textColor(.label)
        .build()
    
    private let totalWorthLabel = UILabelBuilder()
        .textColor(.label)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: SettingsThirdCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}

// MARK: - Configure
extension SettingsThirdCell {
    
    private func configureContents() {
        
    }
}
