//
//  HomeDependencies.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

final class HomeRepository: HomeRepositoryProtocol {
    
    let service: DessertService
    
    init(service: DessertService) {
        self.service = service
    }
    
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError> {
        service.getDesserts()
    }
}
