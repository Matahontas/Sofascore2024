//
//  ApiClient.swift
//  SofascoreAcademy
//
//  Created by Matija Pavicic on 16.04.2024..
//
import Foundation

enum EventApiError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

enum ApiClient {
    
    static let sofaApiUrlString = "https://academy-backend.sofascore.dev/"
    
    static func eventApi(slug: String, date: String, requestMethod: String) async throws -> [EventResponse]{
        
        UserDefaultsHelper.sofaApiUrlString = sofaApiUrlString
        let urlString = sofaApiUrlString + "sport/" + "\(slug)/" + "events/" + "\(date)"
        guard let url = URL(string: urlString) else {
            throw EventApiError.invalidURL
        }
        do {
            var request = URLRequest(url: url)
            request.httpMethod = requestMethod
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let eventResponse = try JSONDecoder().decode([EventResponse].self, from: data)
            return eventResponse
        } catch {
            throw EventApiError.networkError(error)
        }
    }
}
