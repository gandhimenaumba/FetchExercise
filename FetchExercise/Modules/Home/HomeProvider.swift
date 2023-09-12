//
//  HomeProvider.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

final class HomeProvider: HomeProviderProtocol {
    
    let service: DessertServiceProtocol
    
    init(service: DessertServiceProtocol) {
        self.service = service
    }
    
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError> {
        service.getDesserts()
    }
}
