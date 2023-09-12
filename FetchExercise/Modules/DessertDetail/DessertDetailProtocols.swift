//
//  DessertDetailProtocols.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

protocol DessertDetailProviderProtocol: AnyObject {
    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError>
}
