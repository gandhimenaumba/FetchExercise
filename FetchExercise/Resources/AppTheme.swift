//
//  AppTheme.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation
import SwiftUI

enum Theme {
    case v1
    
    var color: Color {
        switch self {
        case .v1:
            return .v1
        }
    }
    
    var colorUI: ColorUI {
        switch self {
        case .v1:
            return .v1
        }
    }
    
    enum Color {
        case v1
    }
    
    enum ColorUI {
        case v1
    }
}
