//
//  HomeProtocols.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine

protocol HomeProviderProtocol: AnyObject {
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError>
}

protocol HomeViewModelProtocol: AnyObject {
    func getDesserts()
}
