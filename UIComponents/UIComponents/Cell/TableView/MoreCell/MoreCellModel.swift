//
//  MoreCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/24/22.
//

import Foundation

public protocol MoreCellDataSource: AnyObject {
    
}

public protocol MoreCellEventSource: AnyObject {
    
}

public protocol MoreCellProtocol: MoreCellDataSource, MoreCellEventSource {
    
}

public final class MoreCellModel: MoreCellProtocol {
    
}
