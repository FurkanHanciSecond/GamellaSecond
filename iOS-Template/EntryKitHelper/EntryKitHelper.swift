//
//  EntryKitHelper.swift
//  Gamella
//
//  Created by Furkan Hanci on 6/16/22.
//

import Foundation
import SwiftEntryKit
import MobilliumBuilders

public enum EntryKitType {
    case success
    case error
    case additional
}

final class EntryKitHelper {
    
    // swiftlint:disable function_body_length
    static func show(_ message: String,
                     additionalMessage: String? = nil,
                     type: EntryKitType, statusBar: EKAttributes.StatusBar = .light) {
        var attributes = EKAttributes.float
        attributes.displayDuration = 2.5
        attributes.statusBar = statusBar
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 16
        
        let stackView = UIStackViewBuilder()
            .axis(.vertical)
            .alignment(.leading)
            .build()
        
        let label = UILabelBuilder()
            .font(.boldSystemFont(ofSize: 15))
            .numberOfLines(0)
            .textColor(.white)
            .textAlignment(.left)
            .text(message)
            .build()
        
        let addionalLabel = UILabelBuilder()
            .font(.boldSystemFont(ofSize: 10))
            .numberOfLines(0)
            .textColor(.white)
            .textAlignment(.left)
            .text(additionalMessage ?? "")
            .build()
        
        let imageView = UIImageViewBuilder()
            .tintColor(.white)
            .size(.init(width: 24, height: 24))
            .build()
        
        
        switch type {
        case .success:
            contentView.backgroundColor = .green
            imageView.image = .checkmark
        case .error:
            contentView.backgroundColor = .black
            imageView.image = .remove
            attributes.hapticFeedbackType = .error
        case .additional:
            contentView.backgroundColor = .blue
            imageView.tintColor = .black
            imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
            label.textColor = .white
            addionalLabel.textColor = .label
            stackView.spacing = .pi
        }
        
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        addionalLabel.isHighlighted = additionalMessage != nil ? false : true
        stackView.edgesToSuperview(excluding: .leading, insets: .init(top: 16, left: 0, bottom: 16, right: 16))
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(addionalLabel)
        
        imageView.centerY(to: label)
        imageView.trailingToLeading(of: stackView, offset: -15)
        imageView.leadingToSuperview(offset: 16)

        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
}
