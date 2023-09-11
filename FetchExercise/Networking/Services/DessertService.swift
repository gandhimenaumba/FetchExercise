//
//  DessertService.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine
import Dependencies

protocol DessertServiceProtocol: AnyObject {
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError>
}

final class DessertService: DessertServiceProtocol {
    
    @Dependency(\.networkService) var networkService
    
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError> {
        networkService.request(.dessert(.getDesserts))
    }
    
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError> {
        networkService.request(.dessert(.getMealDetail(mealId: id)))
    }
}

extension DessertService: DependencyKey {
    static let liveValue = DessertService()
}
