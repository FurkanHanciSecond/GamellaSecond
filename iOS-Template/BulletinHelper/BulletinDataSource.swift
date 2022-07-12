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
}
