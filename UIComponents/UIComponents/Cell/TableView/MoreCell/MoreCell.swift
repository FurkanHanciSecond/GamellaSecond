//
//  MoreCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/24/22.
//

import UIKit

public class MoreCell: UITableViewCell, ReusableView {
    
    weak var viewModel: MoreCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: MoreCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
