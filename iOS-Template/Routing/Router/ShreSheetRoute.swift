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
        let transition = ModalTransition()
        
        open(activityViewController, transition: transition)
    }
}
