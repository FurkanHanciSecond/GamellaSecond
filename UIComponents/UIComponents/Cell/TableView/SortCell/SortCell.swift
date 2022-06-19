//
//  SortCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/19/22.
//

import UIKit

public class SortCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SortCellProtocol?
    
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
    
    public func set(viewModel: SortCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
