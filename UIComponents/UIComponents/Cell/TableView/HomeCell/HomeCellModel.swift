//
//  HomeCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation

public protocol HomeCellDataSource: AnyObject {
    var title : String? { get set }
}

public protocol HomeCellEventSource: AnyObject {
    
}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {
    
}

public final class HomeCellModel: HomeCellProtocol {
    public var title: String?
    
    public init(title : String) {
        self.title = title
    }
}
