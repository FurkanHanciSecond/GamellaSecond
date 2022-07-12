//
//  BulletinDataSource.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/12/22.
//

import UIKit
import BLTNBoard
import MobilliumUserDefaults
enum BulletinDataSource {
    
    static func makeIntroPage() -> BLTNPageItem {
        
        let page = BLTNPageItem(title: "Hi \(DefaultsKey.userName.value ?? "")\nWelcome!")
        page.image = #imageLiteral(resourceName: "locationPrompt")
        
        page.descriptionText = "Discover curated images of the best pets in the world."
        page.actionButtonTitle = "Configure"
        
        page.isDismissable = true
        page.shouldStartWithActivityIndicator = true
        
        page.dismissalHandler = { item in
            DefaultsKey.isFirstBulletIn.value = true
        }
        
        page.actionHandler = { (item: BLTNActionItem) in
            DefaultsKey.isFirstBulletIn.value = true
        }
        
        page.presentationHandler = { item in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                item.manager?.hideActivityIndicator()
            }
            
        }
        
        
        return page
        
    }
}
