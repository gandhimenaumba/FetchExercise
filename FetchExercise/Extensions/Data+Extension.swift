//
//  Data+Extension.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

extension Data {
    var prettyPrintedJSONString: String {
        guard let jsonString = String(data: self, encoding: .utf8) else { return "" }
        return jsonString
    }
}
