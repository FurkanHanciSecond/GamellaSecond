//
//  BulletinDataSource.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/12/22.
//

import UIKit
import BLTNBoard
import MobilliumUserDefaults

final class BulletinDataSource {
    
    static func makeIntroPage() -> BLTNPageItem {
        
        let page = BLTNPageItem(title: "Hi \(DefaultsKey.userName.value ?? "")\nWelcome!")
        page.image = UIImage(named: "introIcon")
        
        page.descriptionText = "Enjoy Gamella, which adds a new style to the game world."
        
        page.isDismissable = true
        page.shouldStartWithActivityIndicator = true
        
        page.dismissalHandler = { item in
            print("dismiss")
            DefaultsKey.isFirstBulletIn.value = false
        }
        
        page.presentationHandler = { item in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                item.manager?.hideActivityIndicator()
            }
            
        }
        
        
        return page
        
    }
    
    static func makePremiumDeal() -> BLTNPageItem {
        let page = BLTNPageItem(title: "Hey!")
        page.image = UIImage(named: "introIcon")
        page.actionButtonTitle = "Let's dive in 🚀"
        
        page.descriptionText = "Have you tried Premium Version? It has so perfect features 🤩"
        
        page.isDismissable = true
        page.shouldStartWithActivityIndicator = false
        
        page.dismissalHandler = { item in
            print("dismiss")
        }
        
        return page
    }
}
