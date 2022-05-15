//
//  ExampleCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/15/22.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

public class ExampleCell: UITableViewCell, ReusableView {
    
    weak var viewModel: ExampleCellProtocol?
    
    private let titleLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 24))
        .textColor(.red)
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
    }
    
    public func set(viewModel: ExampleCellProtocol?) {
        self.viewModel = viewModel
        self.configureContents()
    }
}

// MARK: -  UILayout
extension ExampleCell {
    
    private func addSubViews() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(insets: .horizontal(16) + .vertical(16))
    }
}
// MARK: -  Configure
extension ExampleCell {
    
    private func configureContents() {
        titleLabel.text = viewModel?.title
    }
}
