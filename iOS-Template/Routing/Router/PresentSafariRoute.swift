//
//  PresentSafariRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/19/22.
//

import SafariServices

protocol PresentSafariRoute {
    func presentInSafari(with url: URL)
}

extension ShareSheetRoute where Self: RouterProtocol {
    
    func presentInSafari(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = AppConstants.Style.Color.lightPurple
        let transition = ModalTransition()
        
        open(safariVC, transition: transition)
    }
}
