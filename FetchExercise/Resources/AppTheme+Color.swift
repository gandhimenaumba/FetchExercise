//
//  AppTheme+Color.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation
import SwiftUI

extension Theme.Color {

    var primaryWhite: Color {
        switch self {
        case .v1:
            return .primaryWhite
        }
    }
}

extension Color {
    static let primaryWhite = Color("PrimaryWhite")
}

extension Theme.Color {
    var systemBackground: Color {
        Color(.systemBackground)
    }
    
    var label: Color {
        Color(.label)
    }
    
    var secondaryLabel: Color {
        Color(.secondaryLabel)
    }
    
    var tertiaryLabel: Color {
        Color(.tertiaryLabel)
    }
}
