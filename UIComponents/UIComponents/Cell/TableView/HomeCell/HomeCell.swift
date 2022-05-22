//
//  HomeCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/22/22.
//

import UIKit

public class HomeCell: UITableViewCell, ReusableView {
    
    weak var viewModel: HomeCellProtocol?
    
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
    
    public func set(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
