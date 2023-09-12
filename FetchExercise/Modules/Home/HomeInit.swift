//
//  DessertDetailInit.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

final class HomeInit {
    static func createHomeView() -> HomeView {
        let service = DessertService()
        let provider = HomeProvider(service: service)
        let viewModel = HomeViewModel(provider: provider)
        return HomeView(viewModel: viewModel)
    }
}
