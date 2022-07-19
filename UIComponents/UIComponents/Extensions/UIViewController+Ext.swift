//
//  UIViewController+Ext.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/19/22.
//

import SafariServices

extension UIViewController {
    func presentInSafari(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = AppConstants.Style.Color.lightOrange
        present(safariVC, animated: true, completion: nil)
    }
}
