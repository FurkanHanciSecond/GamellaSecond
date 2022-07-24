//
//  MoreCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 7/24/22.
//

import Foundation

public protocol MoreCellDataSource: AnyObject {
    var title : String? { get set }
    var priceLabel : String? { get set }
    var statusLabel : String? { get set }
    var deadLineLabel : String? { get set }
    var typeLabel : String? { get set }
    var image : String? { get set }
}

public protocol MoreCellEventSource: AnyObject {
    
}

public protocol MoreCellProtocol: MoreCellDataSource, MoreCellEventSource {
    
}

public final class MoreCellModel: MoreCellProtocol {
    public var typeLabel: String?
    public var deadLineLabel: String?
    public var statusLabel: String?
    public var priceLabel: String?
    public var title: String?
    public var image: String?
    
    public init(title : String , priceLabel: String , statusLabel : String , deadLineLabel : String , typeLabel : String , imageData : String) {
        self.title = title
        self.priceLabel = priceLabel
        self.statusLabel = statusLabel
        self.deadLineLabel = deadLineLabel
        self.typeLabel = typeLabel
        self.image = imageData
    }
}
