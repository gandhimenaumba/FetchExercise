//
//  NetworkError.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

enum NetworkError: Error, Equatable {
    case serverError
    case castError
    case badRequest(NetworkRequestError)
    case failed
    case success
    case decodingFailed(String)
    case authError(NetworkRequestError)
}

enum NetworkRequestError: Equatable {
    case genericError(String?)
    case unknown
}
