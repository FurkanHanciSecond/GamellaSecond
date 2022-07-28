//
//  ShreSheetRoute.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/19/22.
//

import UIKit

protocol ShareSheetRoute {
    func presentShareSheet(items: [Any])
}

extension ShareSheetRoute where Self: RouterProtocol {
    
    func presentShareSheet(items: [Any]) {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.mail , UIActivity.ActivityType.postToFacebook , UIActivity.ActivityType.postToTwitter]
        activityViewController.popoverPresentationController?.sourceView = viewController?.view
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: viewController?.view.frame.midX ?? 0, y: viewController?.view.frame.midY ?? 0, width: 0, height: 0)
        let transition = ModalTransition()
        
        open(activityViewController, transition: transition)
    }
}
