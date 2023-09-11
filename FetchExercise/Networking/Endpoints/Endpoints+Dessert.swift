//
//  Endpoints+Dessert.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

extension Endpoints {
    enum Dessert {
        case getDesserts
        case getMealDetail(mealId: String)
    }
}

extension Endpoints.Dessert: RequestProtocol {
    var method: HTTPMethod {
        switch self {
        case .getDesserts, .getMealDetail:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getDesserts:
            return "filter.php"
        case .getMealDetail:
            return "lookup.php"
        }
    }
    
    var parameters: RequestParameters {
        switch self {
        case .getDesserts, .getMealDetail:
            return .none
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getDesserts:
            return [URLQueryItem(name: "c", value: "Dessert")]
        case let .getMealDetail(stringId):
            return [URLQueryItem(name: "i", value: stringId)]
        }
    }
}
