//
//  NetworkCore.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

protocol RequestProtocol {
    var baseURL: String { get }
    var headers: [String: String] { get}
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: RequestParameters { get }
    var queryItems: [URLQueryItem]? { get }
}

extension RequestProtocol {
    var baseURL: String {
        return "https://themealdb.com/api/json/v1/1/\(path)"
    }
    
    var headers: [String: String] {
        [
            "Content-Type": "Application/json"
        ]
    }
}

enum RequestParameters {
    case dictionary(_ dict: [String: Any])
    case none
}

extension RequestParameters {
    var data: Data? {
        switch self {
        case let .dictionary(dict):
            return try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        case .none:
            return nil
        }
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
}
