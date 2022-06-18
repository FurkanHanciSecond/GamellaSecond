//
//  OnboardCell.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/18/22.
//

import UIKit
import TinyConstraints
import MobilliumBuilders

public protocol OnboardCellDelegate: AnyObject {
    func continueButtonTapped()
}

public class OnboardCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: OnboardCellProtocol?
    public weak var delegate: OnboardCellDelegate?
    
    private let titleLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 24))
        .textColor(.black)
        .build()
    
    private let continueButton = UIButtonBuilder()
        .backgroundColor(.red)
        .isHidden(true)
        .build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func set(viewModel: OnboardCellProtocol) {
        self.viewModel = viewModel
        self.configureContents()
    }
}

// MARK: - UILayout
extension OnboardCell {
    
    private func addSubViews() {
        addTitleLabel()
        addContinueButton()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
    
    private func addContinueButton() {
        contentView.addSubview(continueButton)
        continueButton.topToBottom(of: titleLabel, offset: 16)
        continueButton.size(.init(width: 150, height: 50))
        continueButton.centerXToSuperview()
    }
}

// MARK: -  ConfigureContents
extension OnboardCell {
    
    private func configureContents() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        if viewModel.isLast {
            continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
            continueButton.setTitle("Bu son button sadece en son cellde gözükür.", for: .normal)
            continueButton.isHidden = false
        } else {
            continueButton.isHidden = true
        }
    }
}

// MARK: -  Actions
extension OnboardCell {
    
    @objc
    private func continueButtonTapped() {
        delegate?.continueButtonTapped()
    }
}
