//
//  Collection+Extension.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

extension Collection {
    func nilValueRemoved<Wrapped>() -> [Wrapped] where Element == Wrapped? {
        compactMap { $0 }
    }
}
