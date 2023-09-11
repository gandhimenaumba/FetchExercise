//
//  HTTPURLResponse+Extension.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

extension HTTPURLResponse {
    
    enum Status: String {
        case badRequest = "Bad request."
        case failed = "Network request failed."
        case redirect = "This request has been redirected."
        case success = "Success."
        case unableTpDecode = "We could not decode thr response."
        case unauthorized = "You need to be authenticated first."
    }
    
    var status: Status {
        switch statusCode {
        case 200...299: return .success
        case 300...399: return .redirect
        case 401...500: return .unauthorized
        case 400, 5001...599: return .badRequest
        default: return .failed
        }
    }
}
