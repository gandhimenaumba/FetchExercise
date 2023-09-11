//
//  HomeViewCell.swift
//  FetchExercise
//
//  Created by gandhi mena on 11/9/23.
//

import Kingfisher
import SwiftUI

struct HomeViewCell: View {
    
    let meal: DessertMeailResponse
    private let theme: Theme = AppVersion.theme
    
    var body: some View {
        HStack() {
            KFImage(URL(string: meal.imageString ?? "."))
                .resizable()
                .frame(maxWidth: 50, maxHeight: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(meal.name)
                .foregroundColor(theme.color.label)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(Image(.chevronRight))
                .foregroundStyle(.gray)
        }
    }
}

struct HomeViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeRouter.createHomeView()
    }
}
