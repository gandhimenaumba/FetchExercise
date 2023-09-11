//
//  AppLocalizer+Home.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

extension AppLocalizer.AppLocalize {
    enum Home: String {
        
        case navTitle
        case errorMessage
        case refreshButton
        
        var prefix: String  { "home" }
        var localizeString: String { "\(prefix).\(rawValue)" }
    }
}

extension AppLocalizer {
    func home(_ key: AppLocalizer.AppLocalize.Home, comments: [String] = []) -> String {
        localize(key: .home(key), comments: comments)
    }
}
