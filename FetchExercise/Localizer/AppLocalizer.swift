//
//  AppLocalizer.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

enum AppLocalizer {
    case v1
    
    func localize(key: AppLocalizer.AppLocalize, comments: [String?] = [""]) -> String {
        switch self {
        case .v1:
            let string = NSLocalizedString(key.localieString, value: key.localieString, comment: "")
            return String(format: string, arguments: comments.nilValueRemoved())
        }
    }
    
    enum AppLocalize {
        case home(Home)
        case dessertDetail(DessertDetail)
    }
}

extension AppLocalizer.AppLocalize {
    var prefixString: String { "fetch" }
    
    var localieString: String {
        switch self {
        case let .home(key):
            return "\(prefixString).v1.\(key.localizeString)"
        case let .dessertDetail(key):
            return "\(prefixString).v1.\(key.localizeString)"
        }
    }
}
