//
//  GameModel.swift
//  DataProvider
//
//  Created by Furkan Hanci on 6/5/22.
//

import Foundation

public typealias Game = [GameModel]

public struct GameModel: Decodable {
    public let id: Int?
    public let title, worth: String?
    public let thumbnail, image: String?
    public let welcomeDescription, instructions: String?
    public let openGiveawayURL: String?
    public let publishedDate: String?
    public let type: TypeEnum?
    public let platforms, endDate: String?
    public let users: Int?
    public let status: Status?
    public let gamerpowerURL, openGiveaway: String?
    
    public enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image
        case welcomeDescription = "description"
        case instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case type, platforms
        case endDate = "end_date"
        case users, status
        case gamerpowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}

public enum Status: String, Codable {
    case active = "Active"
}

public enum TypeEnum: String, Codable {
    case dlc = "DLC"
    case earlyAccess = "Early Access"
    case game = "Game"
    case other = "Other"
}

