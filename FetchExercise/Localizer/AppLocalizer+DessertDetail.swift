//
//  AppLocalizer+DessertDetail.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

extension AppLocalizer.AppLocalize {
    enum DessertDetail: String {
        
        case navTitle
        case instructions
        case ingredients
        
        var prefix: String  { "dessertDetail" }
        var localizeString: String { "\(prefix).\(rawValue)" }
    }
}

extension AppLocalizer {
    func DessertDetail(_ key: AppLocalizer.AppLocalize.DessertDetail, comments: [String] = []) -> String {
        localize(key: .dessertDetail(key), comments: comments)
    }
}
