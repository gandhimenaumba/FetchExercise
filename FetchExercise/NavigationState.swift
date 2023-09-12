//
//  NavigationState.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

final class NavigationState: ObservableObject {
    @State var routes: [AppRoute] = []
    
}

enum AppRoute: Hashable {
    case home
    case dessertDetail(_ id: String)
}
