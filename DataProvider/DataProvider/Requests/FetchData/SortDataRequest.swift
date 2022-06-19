//
//  SortDataRequest.swift
//  DataProvider
//
//  Created by Furkan Hanci on 6/19/22.
//

public struct SortDataRequest: BaseRequest {
    public typealias ResponseType = Game
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(sortBy: String) {
        path = "giveaways"
        parameters = ["sort-by" : sortBy]
    }
    
}
