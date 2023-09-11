//
//  DessertDetailDescriptionView.swift
//  FetchExercise
//
//  Created by gandhi mena on 11/9/23.
//

import SwiftUI

struct DessertDetailDescriptionView: View {
    private let theme: Theme = AppVersion.theme
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(theme.color.secondaryLabel)
            Text(description)
        }
    }
}

struct DessertDetailDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailDescriptionView(title: "Title", description: "Description")
            .previewLayout(.sizeThatFits)
    }
}
