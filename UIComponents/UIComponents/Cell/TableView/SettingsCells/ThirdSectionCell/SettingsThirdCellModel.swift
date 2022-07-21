//
//  SettingsThirdCellCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/20/22.
//

import Foundation

public protocol SettingsThirdCellDataSource: AnyObject {
    var activeGiveAways: Int? { get set }
    var totalGiveAwaysWorth: String? { get set }
}

public protocol SettingsThirdCellEventSource: AnyObject {
    
}

public protocol SettingsThirdCellProtocol: SettingsThirdCellDataSource, SettingsThirdCellEventSource {
    
}

public final class SettingsThirdCellModel: SettingsThirdCellProtocol {
    
    public var activeGiveAways: Int?
    public var totalGiveAwaysWorth: String?
    
    public init(activeGiveAways: Int , totalGiveAwaysWorth: String) {
        self.activeGiveAways = activeGiveAways
        self.totalGiveAwaysWorth = totalGiveAwaysWorth
    }
}
