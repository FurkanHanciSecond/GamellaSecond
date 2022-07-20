//
//  SettingsCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import Foundation

public protocol SettingsCellDataSource: AnyObject {
    
}

public protocol SettingsCellEventSource: AnyObject {
    
}

public protocol SettingsCellProtocol: SettingsCellDataSource, SettingsCellEventSource {
    
}

public final class SettingsCellModel: SettingsCellProtocol {
    
}
