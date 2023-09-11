//
//  GenericOperators.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation
infix operator |>: AdditionPrecedence

func |> <T, U>(_ value: T, _ f: @escaping ((T) -> U)) -> U {
    f(value)
}
