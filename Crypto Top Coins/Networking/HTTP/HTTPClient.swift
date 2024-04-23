//
//  HTTPClient.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation

enum NetworkError: Error {
    case invalidJSON
    case serverError
    case noNetwork
    case badURL
    case emptyData
}

protocol HTTPInterface {
    func get(url: URL) async throws -> Data
    func get<T: Decodable>(url: URL) async throws -> T
}

public final class HTTPClient: NSObject, HTTPInterface {
    func get(url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        
        guard let code = statusCode,
              (200..<300) ~= code
        else {
            throw NetworkError.serverError
        }
        
        return data
    }
    
    func get<T: Decodable>(url: URL) async throws -> T {
        let data = try await get(url: url)
        return try jsonDecoder.decode(T.self, from: data)
    }
}
