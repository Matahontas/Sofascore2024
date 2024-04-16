//
//  ApiEventModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 16.04.2024..
//

import Foundation

struct EventResponse: Codable {
    
    let createdByNickname: String?
    let eventEditorName: String?
    let hasStandings: Bool
    let hasCupTree: Bool
    let hasIncidents: Bool
    let hasHighlights: Bool
    let hasHighlightsStream: Bool
    let game: Game
    let vote: Vote
    let hasStatistics: Bool
    let hasComments: Bool
    let hasInnings: Bool
    let hasLineups: Bool
    let hasOdds: Bool
    let hasTvChannels: Bool
    let hasLineupsImage: Bool
}

struct Game: Codable {
    
    let sport: Sport
    let rows: Int
    let tournaments: [Tournaments]
    
}

struct Vote: Codable {
    
    let vote1: Int
    let vote2: Int
    let voteX: Int
    let vote1Percentage: String
    let voteXPercentage: String
    let vote2Percentage: String
}

struct Sport: Codable {
    
    let id: Int
    let name: String
    let slug: String
}

struct Tournaments: Codable {
    
    let tournament: Tournament
    let category: TournamentCategory
    let season: Season
    let hasEventPlayerStatistics: Bool
    let hasEventPlayerHeatMap: Bool?
    let hasBoxScore: Bool?
    let displayInverseHomeAwayTeams: Bool
    let events: [Events]
}

struct Tournament: Codable {
    
    let name: String
    let id: Int
    let uniqueId: Int
    let uniqueName: String
    let hasEventPlayerStatistics: Bool
}

struct TournamentCategory: Codable {
    
    let name: String
    let priority: Int
    let id: Int
    let flag: String
}

struct Season: Codable {
    
    let name: String
    let year: String
    let id: Int
}

struct Events: Codable {
    
    let roundInfo: RoundInfo
    let customId: String
    let status: EventStatus
    let venue: Venue
    let homeTeam: Team
    let awayTeam: Team
    let changes: Changes
    let hasHighlights: Bool
    let hasHighlightsStream: Bool
    let hasGlobalHighlights: Bool
    let id: Int
    let cardsCode: String
    let defaultPeriodCount: Int
    let defaultPeriodLength: Int
    let statusDescription: String
    let startTimestamp: Int
    let webUrl: String
    let fbPostId: String
    let hasTime: Bool
    let resultOnly: Bool
    let showEventNote: Bool
    let bet365Links: Bet365Links
}

struct RoundInfo: Codable {
    
    let round: Int
}

struct EventStatus: Codable {
    
    let code: Int
    let type: String
}

struct Venue: Codable {
    
    let city: City
    let stadium: Stadium
    let id: Int
    let hasImage: Bool
    let country: Country
}

struct Team: Codable {
    
    let name: String
    let slug: String
    let shortName: String
    let gender: String
    let nameCode: String
    let disabled: Bool
    let national: Bool
    let id: Int
    let teamColors: TeamColors
}

struct Changes: Codable {
    
    let changeTimestamp: Int
}

struct Bet365Links: Codable {
    
    let deeplink: String
    let joinlink: String
}

struct City: Codable {
    
    let name: String
}

struct Stadium: Codable {
    
    let name: String
    let capacity: Int
}

struct Country: Codable {
    
    let name: String
    let flag: String
}

//Može li primiti Color???
struct TeamColors: Codable {
    
    let primary: String
    let secondary: String
    let text: String
}
