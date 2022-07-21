//
//  GiveAwayDataRequest.swift
//  DataProvider
//
//  Created by Furkan Hanci on 7/21/22.
//

public struct GiveAwayDataRequest: BaseRequest {
    
    public typealias ResponseType = GiveAwayModel
    
    public var path: String = ""
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {
        path = "worth"
    }
    
}
