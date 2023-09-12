//
//  DessertDetailDependencies.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

final class DessertDetailProvider: DessertDetailProviderProtocol {
    
    let service: DessertServiceProtocol
    
    init(service: DessertServiceProtocol) {
        self.service = service
    }
    
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError> {
        service.getDessertDetail(id: id)
    }
}

