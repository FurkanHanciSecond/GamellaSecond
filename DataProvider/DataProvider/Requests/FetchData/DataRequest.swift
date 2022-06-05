//
//  DataRequest.swift
//  DataProvider
//
//  Created by Furkan Hanci on 6/5/22.
//

import Foundation

// MARK: - Maybe change struct name in the future...

public struct GameDataRequest : BaseRequest {
    public typealias ResponseType = Game
    
    public var path: String {
        return "wjkdfb"
    }
    
    public var method: RequestMethod {
        return .get
    }
    
    public init() {}
    
    
}
