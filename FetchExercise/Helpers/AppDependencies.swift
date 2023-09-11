//
//  AppDependencies.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Dependencies

extension DependencyValues {
    var networkService: NetworkService {
        get { self[NetworkService.self] }
        set { self[NetworkService.self] = newValue }
    }
    
    var userService: DessertService {
        get { self[DessertService.self] }
        set { self[DessertService.self] = newValue }
    }
}
