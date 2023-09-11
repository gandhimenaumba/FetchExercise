//
//  Image+Extension.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import SwiftUI

extension Image {
    init(_ symbolName: SFSymbols) {
        self.init(systemName: symbolName.rawValue)
    }
}
