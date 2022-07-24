//
//  AllGiveawayRequest.swift
//  DataProvider
//
//  Created by Furkan Hanci on 7/24/22.
//

public struct AllGiveawayRequest: BaseRequest {
    
    public typealias ResponseType = [GameModel]
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {
        path = "giveaways"
    }
    
}
