//
//  NetworkValidator.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

enum NetworkValidator {
    static var castToHTTPURLResponse: (URLResponse?) -> Result<HTTPURLResponse, NetworkError> {
        { validateOptional($0 as? HTTPURLResponse, NetworkError.castError) }
    }
}
