//
//  DessertDetailRouter.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

final class DessertDetailRouter: DessertDetailRouterProtocol {
    static func createDessertDetailView(id: String) -> DessertDetailView {
        let service = DessertService()
        let repository = DessertDetailRepository(service: service)
        let router = DessertDetailRouter()
        let logic = DessertDetailLogic()
        let viewModel = DessertDetailViewModel(router: router, repository: repository, logic: logic, mealId: id)
        return DessertDetailView(viewModel: viewModel)
    }
}
