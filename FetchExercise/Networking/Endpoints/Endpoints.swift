//
//  Endpoints.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

protocol EndpointProtocol {
    var getService: RequestProtocol { get }
}

enum Endpoints: EndpointProtocol {
    
    case dessert(Dessert)
    
    var getService: RequestProtocol {
        switch self {
        case let .dessert(dessert):
            return dessert
        }
    }
}
