//
//  DessertServiceMock.swift
//  FetchExercise
//
//  Created by gandhi mena on 12/9/23.
//

import Combine
import Foundation

final class DessertServiceMock: DessertServiceProtocol {
    
    func getDesserts() -> AnyPublisher<DessertResponse, NetworkError> {
        Just(.responseMock)
            .delay(for: 0.1, scheduler: RunLoop.main)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }

    func getDessertDetail(id: String) -> AnyPublisher<MealsDetailResponse, NetworkError> {
        Just(.meailsDetailResponseMock)
            .delay(for: 0.1, scheduler: RunLoop.main)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }
}

extension DessertResponse {
    static var responseMock: DessertResponse {
        DessertResponse(meals: mealsResponseMock)
    }
    
    private static var mealsResponseMock: [DessertMeailResponse] {
        [
            DessertMeailResponse(name: "Banana Pancakes",
                                 imageString: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
                                 idMeal: "52855"),
            DessertMeailResponse(name: "Apam balik",
                                 imageString: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                                 idMeal: "53049"),
            DessertMeailResponse(name: "Carrot Cake",
                                 imageString: "https://www.themealdb.com/images/media/meals/vrspxv1511722107.jpg",
                                 idMeal: "52897")
        ]
    }
}

extension MealsDetailResponse {
    static var meailsDetailResponseMock: MealsDetailResponse {
        MealsDetailResponse(meals: mealDetailListResponseMock)
    }
    
    static var mealDetailListResponseMock: [MealDetailResponse] {
        [
            MealDetailResponse(name: "Apam balik", instructions: "instructions mock", ingredient1: "Eggs", measure1: "2")
        ]
    }
}
