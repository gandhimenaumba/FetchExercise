//
//  GenericValidators.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

func validateOptional<T, E>(_ element: T?, _ error: E) -> Result<T,E> where E: Error {
    guard let object = element else { return .failure(error) }
    return .success(object)
}
