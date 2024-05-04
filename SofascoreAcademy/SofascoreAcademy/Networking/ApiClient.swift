//
//  ApiClient.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 16.04.2024..
//
import Foundation

enum ApiClient {
    
    static let sofaApiUrlString = "https://static-api.sofascore.dev/"
    
    static func getEvent(id: Int) async throws -> EventResponse{
        
        let urlString = sofaApiUrlString + "api/" + "event/" + "\(id)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let eventResponse = try JSONDecoder().decode(EventResponse.self, from: data)
        return eventResponse
    }
}
