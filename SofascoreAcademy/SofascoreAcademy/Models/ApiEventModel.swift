//
//  FootballApiModel.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 06.05.2024..
//

import Foundation

struct EventResponse: Codable {
    
    let id: Int
    let slug: String
    let tournament: Tournament
    let homeTeam: Team
    let awayTeam: Team
    let status: String
    let startDate: String
    let homeScore: Score
    let awayScore: Score
    let winnerCode: String?
    let round: Int
}

struct Tournament: Codable {
    
    let id: Int
    let name: String
    let slug: String
    let sport: Sport
    let country: Country
    let numberOfCompetitors: Int?
    let headToHeadCount: Int?
}

struct Team: Codable {
    
    let id: Int
    let name: String
    let country: Country
}

struct Score: Codable {
    
    let total: Int?
    let period1: Int?
    let period2: Int?
    let period3: Int?
    let period4: Int?
    let overtime: Int?
}

struct Sport: Codable {
    
    let id: Int
    let name: String
    let slug: String
}

struct Country: Codable {
    
    let id: Int
    let name: String
}

//INCIDENTS
struct EventIncidentsResponse: Codable {
    
    let player: Player?
    let teamSide: String?
    let scoringTeam: String?
    let homeScore: Int?
    let awayScore: Int?
    let goalType: String?
    let color: String?
    let id: Int
    let time: Int
    let type: String
    let text: String?
}

struct Player: Codable {
    
    let id: Int
    let name: String
    let slug: String
    let country: Country
    let position: String
}

//TOURNAMENT STANDINGS
struct TournamentStandingsResponse: Codable {
    let id: Int
    let tournament: Tournament
    let type: String
    let sortedStandingsRows: [SortedStandingsRows]
}

struct SortedStandingsRows: Codable {
    let id: Int
    let team: Team
    let points: Int?
    let scoresFor: Int
    let scoresAgainst: Int
    let played: Int
    let wins: Int
    let draws: Int
    let losses: Int
    let percentage: Double?
}
