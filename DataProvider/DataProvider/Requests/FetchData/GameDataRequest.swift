//
//  GameDataRequest.swift
//  DataProvider
//
//  Created by Furkan Hanci on 6/13/22.
//

public struct GameDataRequest: BaseRequest {
    
    public typealias ResponseType = [GameModel]
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(platform: String , type: String , sortBy : String) {
        path = "giveaways"
        parameters = ["platform" : platform , "type" : type , "sort-by" : sortBy]
    }
}
