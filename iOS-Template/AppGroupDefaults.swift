//
//  AppGroupDefaults.swift
//  Gamella
//
//  Created by Furkan Hanci on 7/29/22.
//

import UIKit

final class AppGroupDefaults {
    static let shared = AppGroupDefaults()
    
    init() {}
    
    func becomePremium() {
        let defaults = UserDefaults(suiteName: "group.com.furkanhanci.Gamella")
        defaults?.set(true, forKey: "isPremium")
        defaults?.synchronize()
        print(defaults?.bool(forKey: "isPremium"))
    }
    
    func readPremium() {
        let defaults = UserDefaults(suiteName: "group.com.furkanhanci.Gamella")
        defaults?.bool(forKey: "isPremium")
        print(defaults?.bool(forKey: "isPremium"))
    }
}
