//
//  OnboardCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/18/22.
//

import UIKit

public class OnboardCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: OnboardCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: OnboardCellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
