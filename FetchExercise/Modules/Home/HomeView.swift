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
    private let localizer: AppLocalizer = AppVersion.localizer
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(viewModel.dessertsFiltered) { meal in
                            NavigationLink(value: meal) {
                                HomeViewCell(meal: meal)
                            }
                        }
                    }
                    .refreshable {
                        viewModel.getDesserts()
                    }
                }
            }
            .navigationTitle(localizer.home(.navTitle))
            .navigationDestination(for: DessertMeailResponse.self) { meail in
                DessertDetailInit.createDessertDetailView(id: meail.idMeal)
            }
            .navigationBarTitleDisplayMode(.large)
            .task {
                if viewModel.desserts.isEmpty {
                    viewModel.getDesserts()
                }
            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeInit.createHomeView()
    }
}
