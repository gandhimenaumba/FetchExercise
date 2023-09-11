//
//  DessertDetailDependencies.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Dependencies
import Combine

final class DessertDetailRepository: DessertDetailRepositoryProtocol {
    @Dependency(\.userService) var userService
    
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError> {
        userService.getDessertDetail(id: id)
    }
}

