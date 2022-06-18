//
//  OnboardCellModel.swift
//  UIComponents
//
//  Created by Furkan Hanci on 6/18/22.
//

import Foundation

public protocol OnboardCellDataSource: AnyObject {
    
}

public protocol OnboardCellEventSource: AnyObject {
    
}

public protocol OnboardCellProtocol: OnboardCellDataSource, OnboardCellEventSource {
    
}

public final class OnboardCellModel: OnboardCellProtocol {
    
}
