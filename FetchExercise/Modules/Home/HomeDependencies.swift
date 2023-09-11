//
//  HomeDependencies.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine
import Dependencies

final class HomeRepository: HomeRepositoryProtocol {
    
    @Dependency(\.userService) var userService
    
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError> {
        userService.getDesserts()
    }
}
