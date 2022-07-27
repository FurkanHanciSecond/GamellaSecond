//
//  DefaultKeys+Extensions.swift
//  Utilities
//
//  Created by Ercan Garip on 26.01.2022.
//

import Foundation
import MobilliumUserDefaults

public extension DefaultsKey {
    static let isFirstRun = Key<Bool>(key: "firstRun")
    static let userName = Key<String>(key: "userName")
    static let isFirstBulletIn = Key<Bool>(key: "firsBulletIn")
    static let isPremium = Key<Bool>(key: "isPremium")
}
