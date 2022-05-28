//
//  HomeCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/22/22.
//

import UIKit
import MobilliumBuilders
import TinyConstraints
public class HomeCell: UITableViewCell, ReusableView {
    
    private lazy var titleLabel = UILabelBuilder()
        .textColor(.red)
        .font(.systemFont(ofSize: 35))
        .numberOfLines(0)
        .build()
    weak var viewModel: HomeCellProtocol?
    
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
    
    public func set(viewModel: HomeCellProtocol) {
        self.viewModel = viewModel
        self.configureContents()
    }
    
}

// MARK: - UI Layout

extension HomeCell {
    private func addSubViews() {
        addLabel()
    }
    
    private func addLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(insets: .horizontal(16) + .vertical(16))
    }
}


// MARK: -  Configure
extension HomeCell {
    private func configureContents() {
        titleLabel.text = viewModel?.title
    }
}
