//
//  OnboardCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/18/22.
//

import Foundation

public protocol OnboardCellDataSource: AnyObject {
    var title: String? { get set }
    var description: String? { get set }
    var isLast: Bool { get set }
}

public protocol OnboardCellEventSource: AnyObject {
    
}

public protocol OnboardCellProtocol: OnboardCellDataSource, OnboardCellEventSource {
    
}

public final class OnboardCellModel: OnboardCellProtocol {
    
    public var isLast: Bool = false
    public var title: String?
    public var description: String?
    
    public init(description: String?, title: String?, isLast: Bool = false) {
        self.title = title
        self.isLast = isLast
        self.description = description
    }
}
