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
        let repository = HomeRepository()
        let viewModel = HomeViewModel(router: router, repository: repository)
        return HomeView(viewModel: viewModel)
    }
}
