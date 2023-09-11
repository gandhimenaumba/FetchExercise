//
//  FetchExerciseApp.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

@main
struct FetchExerciseApp: App {
    
    @StateObject private var navigationState = NavigationState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationState.routes) {
                HomeRouter.createHomeView()
                    .navigationDestination(for: AppRoute.self) { routes in
                        switch routes {
                        case .home:
                            HomeRouter.createHomeView()
                        case let .dessertDetail(id):
                            DessertDetailRouter.createDessertDetailView(id: id)
                        }
                    }
            }
            .environmentObject(navigationState)
        }
    }
}
