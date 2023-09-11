//
//  ErrorView.swift
//  FetchExercise
//
//  Created by gandhi mena on 11/9/23.
//

import SwiftUI

struct ErrorView: View {
    private let theme: Theme = AppVersion.theme
    private let localizer: AppLocalizer = AppVersion.localizer
    var title: String
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            Text("😅")
                .font(.title)
            Text(title)
                .font(.title3)
                .foregroundColor(theme.color.secondaryLabel)
                .multilineTextAlignment(.center)
            Button(action: action) {
                HStack {
                    Text(Image(.refresh))
                    Text(localizer.home(.refreshButton))
                }
            }
        }
    }
}
