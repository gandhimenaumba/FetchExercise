//
//  HomeView.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @EnvironmentObject private var navigationState: NavigationState
    private let localizer: AppLocalizer = AppVersion.localizer
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if viewModel.isError {
                ErrorView(title: localizer.home(.errorMessage), action: viewModel.getDesserts)
            } else {
                List(viewModel.dessertsFiltered, id: \.idMeal.self) { meal in
                    HomeViewCell(meal: meal)
                        .onTapGesture {
                            navigationState.routes.append(.dessertDetail(meal.idMeal))
                        }
                }
            }
        }
        .navigationTitle(localizer.home(.navTitle))
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            if viewModel.desserts.isEmpty {
                viewModel.isLoading = true
                viewModel.getDesserts()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeRouter.createHomeView()
    }
}
