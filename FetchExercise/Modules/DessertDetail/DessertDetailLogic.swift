//
//  DessertDetailLogic.swift
//  FetchExercise
//
//  Created by gandhi mena on 9/9/23.
//

import Foundation

final class DessertDetailLogic {
    
    func getIngredientsMeasuresStringBy(mealDetail: MealDetailResponse?) -> String {
        guard let meal: [String: Any] = mealDetail?.dictionary else { return "" }
        let ingredientes: [Dictionary<String, Any>.Element] = meal
            .compactMap { key, value in
                guard let stringValue = value as? String, !stringValue.isEmpty, key.hasPrefix("strIngredient") else {
                    return nil
                }
                return (key, value)
            }
            .sorted { $0.key.suffix(3) < $1.key.suffix(3) }
        let measures = meal
            .filter { $0.key.hasPrefix("strMeasure") }
            .sorted { $0.key.suffix(5) < $1.key.suffix(5) }
        let array = zip(ingredientes, measures).map { ingrediente, measure in
            "   ・ \(ingrediente.value) ⏤ \(measure.value)"
        }
        return array.joined(separator: "\n")
    }
}
