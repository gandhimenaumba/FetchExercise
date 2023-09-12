//
//  DessertDetailDependencies.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

final class DessertDetailRepository: DessertDetailRepositoryProtocol {
    
    let service: DessertService
    
    init(service: DessertService) {
        self.service = service
    }
    
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError> {
        service.getDessertDetail(id: id)
    }
}

