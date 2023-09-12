//
//  DessertDetailViewModel.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI
import Combine

final class DessertDetailViewModel: ObservableObject {
    
    private let repository: DessertDetailRepositoryProtocol
    private let router: DessertDetailRouterProtocol
    private var mealId: String
    private var subscriptions = Set<AnyCancellable>()
    private let logic: DessertDetailLogic
    @Published var isLoading: Bool = true
    @Published var mealDetail: MealDetailResponse?
    @Published var isError: Bool = false
    
    var finalIngredientes: String {
        logic.getIngredientsMeasuresStringBy(mealDetail: mealDetail)
    }
    
    var mealName: String {
        mealDetail?.name ?? ""
    }
    
    var instructions: String {
        mealDetail?.instructions ?? ""
    }
    
    init(router: DessertDetailRouterProtocol, repository: DessertDetailRepositoryProtocol, logic: DessertDetailLogic, mealId: String) {
        self.repository = repository
        self.router = router
        self.logic = logic
        self.mealId = mealId
    }
    
    func getDessertDetail() async {
        await repository.getDessertDetail(id: mealId).sink(receiveCompletion: { [weak self] completion in
            if case let .failure(error) = completion {
                print(error)
                self?.isLoading = false
                self?.isError = true
            }
        }) { response in
            self.mealDetail = response.meals.first
            self.isLoading = false
            self.isError = false
        }
        .store(in: &subscriptions)
    }
}

