//
//  HomeViewModel.swift.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine
import SwiftUI

final class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    
    let provider: HomeProviderProtocol
    @Published var desserts: [DessertMeailResponse] = []
    private var subscriptions = Set<AnyCancellable>()
    @Published var isLoading: Bool = true
    @Published var isError: Bool = false
    
    init(provider: HomeProviderProtocol) {
        self.provider = provider
    }
    
    var dessertsFiltered: [DessertMeailResponse] {
        desserts.sorted { $0.name < $1.name }
    }
    
    func getDesserts() {
        provider.getDesserts().sink(receiveCompletion: { [weak self] completion in
            if case let .failure(error) = completion {
                print(error)
                self?.isLoading = false
                self?.isError = true
            }
        }) { response in
            self.desserts = response.meals
            self.isLoading = false
            self.isError = false
        }
        .store(in: &subscriptions)
    }
}

