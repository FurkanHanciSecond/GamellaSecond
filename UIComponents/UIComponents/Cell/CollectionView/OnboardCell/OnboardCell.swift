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
        .font(.systemFont(ofSize: 50, weight: .thin))
        .textColor(.label)
        .numberOfLines(0)
        .build()
    
    private let descriptionLabel = UILabelBuilder()
        .font(.systemFont(ofSize: 20, weight: .regular))
        .textColor(.label)
        .numberOfLines(1)
        .adjustsFontSizeToFitWidth(true)
        .minimumScaleFactor(0.5)
        .build()
    
    private let continueButton = UIButtonBuilder()
        .cornerRadius(20)
        .title(AppConstants.Texts.Button.onboardButtonText)
        .titleFont(.systemFont(ofSize: 20))
        .backgroundColor(AppConstants.Style.Color.indigo!)
        .titleColor(AppConstants.Style.Color.white, for: .normal)
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
        addDescriptionLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
    
    private func addDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: titleLabel , offset: 8)
        descriptionLabel.centerXToSuperview()
    }
    
    private func addContinueButton() {
        contentView.addSubview(continueButton)
        continueButton.topToBottom(of: titleLabel, offset: 56)
        continueButton.width(200)
        continueButton.centerXToSuperview()
    }
}

// MARK: -  ConfigureContents
extension OnboardCell {
    
    private func configureContents() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        if viewModel.isLast {
            continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
            continueButton.setTitle("Let's get start 🚀", for: .normal)
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
