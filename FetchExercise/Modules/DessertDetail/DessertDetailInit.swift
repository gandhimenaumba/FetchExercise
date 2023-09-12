//
//  DessertDetailInit.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

final class DessertDetailInit {
    static func createDessertDetailView(id: String) -> DessertDetailView {
        let service = DessertService()
        let provider = DessertDetailProvider(service: service)
        let logic = DessertDetailLogic()
        let viewModel = DessertDetailViewModel(provider: provider, logic: logic, mealId: id)
        return DessertDetailView(viewModel: viewModel)
    }
}
