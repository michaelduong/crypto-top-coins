//
//  HTTPClient.swift
//  Crypto Top Coins
//
//  Created by Michael Duong on 4/23/24.
//

import Foundation
import Network

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

public final class HTTPClient: NSObject, HTTPInterface, ObservableObject {
    func get(url: URL) async throws -> Data {
        guard await checkConnectivity() else {
            throw NetworkError.noNetwork
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        configuration.timeoutIntervalForRequest = 30 // 30 seconds
        configuration.timeoutIntervalForResource = 60 * 15 // 15 minutes
        
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(from: url)
        
        session.finishTasksAndInvalidate()
        
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

extension HTTPClient {
    // Function to check network connectivity
    func checkConnectivity() async -> Bool {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue.global(qos: .background)
        
        return await withCheckedContinuation { continuation in
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    continuation.resume(returning: true)
                } else {
                    continuation.resume(returning: false)
                }
                monitor.cancel()
            }
            monitor.start(queue: queue)
        }
    }
}
