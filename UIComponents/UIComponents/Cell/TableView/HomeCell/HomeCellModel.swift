//
//  HomeCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation

public protocol HomeCellDataSource: AnyObject {
    var title : String? { get set }
    var priceLabel : String? { get set }
    var statusLabel : String? { get set }
    var deadLine : String? { get set }
}

public protocol HomeCellEventSource: AnyObject {
    
}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {
    
}

public final class HomeCellModel: HomeCellProtocol {
    public var deadLine: String?
    public var statusLabel: String?
    public var priceLabel: String?
    public var title: String?
    
    public init(title : String , priceLabel: String , statusLabel : String , deadLine : String) {
        self.title = title
        self.priceLabel = priceLabel
        self.statusLabel = statusLabel
        self.deadLine = deadLine
    }
}
