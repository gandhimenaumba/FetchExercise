//
//  NetworkErrorData.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

struct NetworkErrorData: Codable, Equatable {
    let message: String
    let data: NetworkErrorDataResponse

}

struct NetworkErrorDataResponse: Codable, Equatable {
    let dataMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case dataMessage = "data_message"
    }
}
