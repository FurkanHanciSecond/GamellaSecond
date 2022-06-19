//
//  SortCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/19/22.
//

import Foundation

public protocol SortCellDataSource: AnyObject {
    
}

public protocol SortCellEventSource: AnyObject {
    
}

public protocol SortCellProtocol: SortCellDataSource, SortCellEventSource {
    
}

public final class SortCellModel: SortCellProtocol {
    
}
