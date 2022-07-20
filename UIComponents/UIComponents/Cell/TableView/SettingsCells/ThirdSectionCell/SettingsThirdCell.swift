//
//  SettingsThirdCellCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import UIKit

public class SettingsThirdCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SettingsThirdCellCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: SettingsThirdCellCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
