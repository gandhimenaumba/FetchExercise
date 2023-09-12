//
//  DessertDetailView.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

struct DessertDetailView: View {
    
    private let localizer: AppLocalizer = AppVersion.localizer
    private let theme: Theme = AppVersion.theme
    @StateObject var viewModel: DessertDetailViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    Text(viewModel.mealName)
                        .foregroundStyle(theme.color.primaryWhite)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Rectangle().fill(Gradient(colors: [.blue, .purple])
                        )
                    )
                    VStack(alignment: .leading, spacing: 10) {
                        DessertDetailDescriptionView(title: localizer.DessertDetail(.instructions),
                                                     description: viewModel.instructions)
                        DessertDetailDescriptionView(title: localizer.DessertDetail(.ingredients),
                                                     description: viewModel.finalIngredientes)
                    }.padding()
                }
            }
        }
        .navigationTitle(localizer.DessertDetail(.navTitle))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            viewModel.getDessertDetail()
        }
    }
}

struct DessertDetail_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailInit.createDessertDetailView(id: "53049")
    }
}
