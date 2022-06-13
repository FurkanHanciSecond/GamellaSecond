//
//  UITableView+Extensions.swift
//  UIComponents
//
//  Created by Ercan Garip on 5.01.2022.
//

import UIKit
import MobilliumBuilders

// swiftlint:disable fatal_error
public extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func setEmptyView(message: String , image: UIImage) {
        let emptyView = UIView()
        emptyView.size(.init(width: bounds.width, height: bounds.height))
        emptyView.alpha = 0.8
        
        let circleView = UIViewBuilder()
            .backgroundColor(.yellow)
            .alpha(0.5)
            .cornerRadius(36)
            .build()
            
        let imageView = UIImageViewBuilder()
            .contentMode(.scaleAspectFit)
            .image(image)
            .build()
        
        let messageLabel = UILabelBuilder()
            .numberOfLines(0)
            .textAlignment(.center)
            .text(message)
            .font(.systemFont(ofSize: 20))
            .textColor(.label)
            .build()
        
        emptyView.addSubview(circleView)
        circleView.size(.init(width: 72, height: 72))
        
        circleView.centerInSuperview()
        
        circleView.addSubview(imageView)
        imageView.size(.init(width: 40, height: 40))
        imageView.centerInSuperview()
        
        emptyView.addSubview(messageLabel)
        
        messageLabel.topToBottom(of: circleView, offset: 5)
        
        messageLabel.horizontalToSuperview(insets: .horizontal(-5))
        
        self.backgroundView = emptyView
    }
    
    func restoreTableView() {
        self.backgroundView = nil
    }
}
// swiftlint:enable fatal_error
