//
//  HomeRouter.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

final class HomeRouter: HomeRouterProtocol {
    static func createHomeView() -> HomeView {
        let router = HomeRouter()
        let service = DessertService()
        let repository = HomeRepository(service: service)
        let viewModel = HomeViewModel(router: router, repository: repository)
        return HomeView(viewModel: viewModel)
    }
}
