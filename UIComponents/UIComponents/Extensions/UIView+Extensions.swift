//
//  UIView+Extensions.swift
//  UIComponents
//
//  Created by Ercan Garip on 10.12.2021.
//

import UIKit

final class ClickListener: UITapGestureRecognizer {
    private var action: () -> Void
    
    init(_ action: @escaping () -> Void) {
        self.action = action
        super.init(target: nil, action: nil)
        self.addTarget(self, action: #selector(execute))
    }
    
    @objc
    private func execute() {
        action()
    }
}

public extension UIView {
    func onTap(_ action: @escaping () -> Void) {
        self.isUserInteractionEnabled = true
        let click = ClickListener(action)
        self.addGestureRecognizer(click)
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func pinToCorners(to view : UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview?.topAnchor ?? .init()),
            bottomAnchor.constraint(equalTo: superview?.bottomAnchor ?? .init()),
            leadingAnchor.constraint(equalTo: superview?.leadingAnchor ?? .init()),
            trailingAnchor.constraint(equalTo: superview?.trailingAnchor ?? .init())
        ])
    }
    
    func startActivityIndicator() {
        let backgroundView = UIView()
        backgroundView.frame = .init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.tag = 99
        
        var activityIndicator: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .gray)
        }
        activityIndicator.color = .gray
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        self.addSubview(backgroundView)
    }
    
    func stopActivityIndicator() {
        if let background = viewWithTag(99) {
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}

public extension UIView {
    @discardableResult
    func addLineDashedStroke(pattern: [NSNumber]?, radius: CGFloat, color: CGColor, borderWidth: CGFloat = 2) -> CALayer {
        let borderLayer = CAShapeLayer()
        
        borderLayer.strokeColor = color
        borderLayer.lineDashPattern = pattern
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        borderLayer.fillColor = nil
        borderLayer.lineCap = .round
        borderLayer.path = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        self.layoutSubviews()
        
        layer.addSublayer(borderLayer)
        return borderLayer
    }
}
