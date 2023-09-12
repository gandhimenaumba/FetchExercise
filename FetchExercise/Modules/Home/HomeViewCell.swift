//
//  HomeViewCell.swift
//  FetchExercise
//
//  Created by gandhi mena on 11/9/23.
//

import SwiftUI

struct HomeViewCell: View {
    
    let meal: DessertMeailResponse
    private let theme: Theme = AppVersion.theme
    
    var body: some View {
        HStack() {
            CacheAsyncImage(url: URL(string: meal.imageString)!) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else if phase.error != nil {
                    EmptyView()
                } else {
                    ProgressView()
                }
            }
            .frame(maxWidth: 50, maxHeight: 50)
            Text(meal.name)
                .foregroundColor(theme.color.label)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct HomeViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeInit.createHomeView()
    }
}
