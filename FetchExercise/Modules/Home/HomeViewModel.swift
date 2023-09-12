//
//  HomeViewModel.swift.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine
import SwiftUI

final class HomeViewModel: ObservableObject, HomeViewModelProtocol {
    
    let repository: HomeRepositoryProtocol
    let router: HomeRouterProtocol
    @Published var desserts: [DessertMeailResponse] = []
    private var subscriptions = Set<AnyCancellable>()
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    
    init(router: HomeRouterProtocol, repository: HomeRepositoryProtocol) {
        self.repository = repository
        self.router = router
    }
    
    var dessertsFiltered: [DessertMeailResponse] {
        desserts.sorted { $0.name < $1.name }
    }
    
    func getDesserts() {
         repository.getDesserts().sink(receiveCompletion: { [weak self] completion in
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

