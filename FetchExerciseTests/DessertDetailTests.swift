//
//  DessertDetailTests.swift
//  FetchExerciseTests
//
//  Created by gandhi mena on 12/9/23.
//

@testable import FetchExercise
import XCTest
import Combine

final class DessertDetailTests: XCTestCase {
    
    private var subscriptions = Set<AnyCancellable>()

    func test_init() {
        let viewModel = getViewModel()
        XCTAssertNil(viewModel.mealDetail)
        XCTAssertEqual(viewModel.isError, false)
        XCTAssertEqual(viewModel.isLoading, true)
    }
    
    func test_get_dessert_detail() {
        let service = dessertService
        let viewModel = getViewModel(service: service)
        let expectResponse = MealsDetailResponse.responseTestMock
        let id = mealId
        let expectation = XCTestExpectation(description: "DessertsDetailResponseSuccess")
        service.getDessertDetail(id: id ).sink { _ in } receiveValue: { response in
            viewModel.mealDetail = response.meals.first
            XCTAssertEqual(response.meals.first, expectResponse.meals.first)
            viewModel.isLoading = false
            expectation.fulfill()
        }
        
        .store(in: &subscriptions)
        wait(for: [expectation])
        XCTAssertEqual(viewModel.mealDetail, expectResponse.meals.first)
        XCTAssertEqual(viewModel.isLoading, false)
        XCTAssertEqual(viewModel.isError, false)
    }
    
    func test_getIngredientsMeasuresStringBy_logic() {
        let logic = DessertDetailLogic()
        let mockResponseItem = MealsDetailResponse.mealDetailResponseItemMock
        XCTAssertEqual(logic.getIngredientsMeasuresStringBy(mealDetail: mockResponseItem), "   ・ Eggs ⏤ 2")
    }
}

extension DessertDetailTests {
    fileprivate func getViewModel(service: DessertServiceProtocol = DessertServiceMock()) -> DessertDetailViewModel {
        let provider = DessertDetailProvider(service: service)
        let logic = DessertDetailLogic()
        let sut = DessertDetailViewModel(provider: provider, logic: logic, mealId: mealId)
        return sut
    }
    
    fileprivate var mealId: String {
        return "1245"
    }
    
    fileprivate var dessertService: DessertServiceProtocol {
        DessertServiceMock()
    }
    
    
}

extension MealsDetailResponse {
    fileprivate static var responseTestMock: MealsDetailResponse {
        MealsDetailResponse(meals: mealDetailListResponseMock)
    }
    
    fileprivate static var mealDetailListResponseMock: [MealDetailResponse] {
        [
            mealDetailResponseItemMock
        ]
    }
    
    fileprivate static var mealDetailResponseItemMock: MealDetailResponse {
        MealDetailResponse(name: "Apam balik", instructions: "instructions mock", ingredient1: "Eggs", measure1: "2")
    }
    
}
