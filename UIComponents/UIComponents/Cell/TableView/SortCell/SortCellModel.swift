//
//  SortCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/19/22.
//

import Foundation

public protocol SortCellDataSource: AnyObject {
    var title: String? { get set }
}

public protocol SortCellEventSource: AnyObject {
    
}

public protocol SortCellProtocol: SortCellDataSource, SortCellEventSource {
    
}

public final class SortCellModel: SortCellProtocol {
    public var title: String?
    
    public init(title : String) {
        self.title = title
    }
}
