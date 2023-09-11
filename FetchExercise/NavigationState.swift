//
//  NavigationState.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

final class NavigationState: ObservableObject {
    @Published var routes: [AppRoute] = []
    
}

enum AppRoute: Hashable {
    case home
    case dessertDetail(_ id: String)
}
