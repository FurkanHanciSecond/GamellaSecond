//
//  SortCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/19/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
public class SortCell: UITableViewCell, ReusableView {
    
    weak var viewModel: SortCellProtocol?
    
    private let titleLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 18 , weight: .semibold))
        .textColor(AppConstants.Style.Color.black)
        .numberOfLines(0)
        .build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    public func set(viewModel: SortCellProtocol) {
        self.viewModel = viewModel
        self.configureContents()
    }
    
}

// MARK: - UI Layout
extension SortCell {
    private func addSubViews() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview()
    }
}

// MARK: - Configures
extension SortCell {
    private func configureContents() {
        titleLabel.text = viewModel?.title
    }
}
