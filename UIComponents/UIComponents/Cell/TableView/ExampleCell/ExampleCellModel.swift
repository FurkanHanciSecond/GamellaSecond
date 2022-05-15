//
//  ExampleCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/15/22.
//

import Foundation

public protocol ExampleCellDataSource: AnyObject {
    var title: String? { get set }
}

public protocol ExampleCellEventSource: AnyObject {
    
}

public protocol ExampleCellProtocol: ExampleCellDataSource, ExampleCellEventSource {
    
}

public final class ExampleCellModel: ExampleCellProtocol {
    
    public var title: String?
    
    public init(title: String?) {
        self.title = title
    }
}
