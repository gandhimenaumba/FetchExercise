//
//  DessertResponse.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Foundation

struct DessertResponse: Decodable {
    
    let meals: [DessertMeailResponse]
    
    init(meals: [DessertMeailResponse]) {
        self.meals = meals
    }
}

struct DessertMeailResponse: Codable, Equatable, Hashable {
    let name: String
    let imageString: String?
    let idMeal: String
    
    init(name: String, imageString: String?, idMeal: String) {
        self.name = name
        self.imageString = imageString
        self.idMeal = idMeal
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case imageString = "strMealThumb"
        case idMeal
    }
}