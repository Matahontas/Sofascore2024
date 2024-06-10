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
        
    static func getApiData<T: Decodable>(urlAddition: String, requestMethod: String, responseType: T.Type) async throws -> T {
        
        let urlString = .sofa_api_url_string + "\(urlAddition)"
        guard let url = URL(string: urlString) else {
            throw EventApiError.invalidURL
        }
        do {
            var request = URLRequest(url: url)
            request.httpMethod = requestMethod
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let responseData = try JSONDecoder().decode(responseType, from: data)
            return responseData
        } catch {
            throw EventApiError.networkError(error)
        }

    }
}
