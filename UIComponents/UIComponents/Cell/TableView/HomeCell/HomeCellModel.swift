//
//  HomeCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 5/22/22.
//

import Foundation
import UIKit

public protocol HomeCellDataSource: AnyObject {
    var title : String? { get set }
    var priceLabel : String? { get set }
    var statusLabel : String? { get set }
    var deadLineLabel : String? { get set }
    var typeLabel : String? { get set }
    var image : String? { get set }
}

public protocol HomeCellEventSource: AnyObject {
    
}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource {
    
}

public final class HomeCellModel: HomeCellProtocol {
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
