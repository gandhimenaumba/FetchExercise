//
//  DessertService.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

protocol DessertServiceProtocol: AnyObject {
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError>
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError>
}

final class DessertService: DessertServiceProtocol {
    
    let coreService: NetworkService
    
    init(coreService: NetworkService = NetworkService()) {
        self.coreService = coreService
    }
    
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError> {
        coreService.request(.dessert(.getDesserts))
    }
    
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError> {
        coreService.request(.dessert(.getMealDetail(mealId: id)))
    }
}
