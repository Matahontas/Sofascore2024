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
