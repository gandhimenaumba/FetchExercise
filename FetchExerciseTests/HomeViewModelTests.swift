//
//  HomeViewModelTests.swift
//  FetchExerciseTests
//
//  Created by gandhi mena on 12/9/23.
//

@testable import FetchExercise
import XCTest
import Combine

class HomeViewModelTests: XCTestCase {
    
    private var subscriptions = Set<AnyCancellable>()
    
    func test_init() {
        let viewModel = getViewModel()
        XCTAssertEqual(viewModel.desserts, [])
        XCTAssertEqual(viewModel.isError, false)
        XCTAssertEqual(viewModel.isLoading, true)
    }
    
    func test_get_desserts() {
        let service = dessertService
        let viewModel = getViewModel(service: service)
        let expectResponse = DessertResponse.responseTestMock
        let expectation = XCTestExpectation(description: "DessertsResponseSuccess")
        service.getDesserts().sink { _ in } receiveValue: { response in
            viewModel.desserts = response.meals
            XCTAssertEqual(response.meals.count, DessertResponse.sortedList.count)
            viewModel.isLoading = false
            expectation.fulfill()
        }
        .store(in: &subscriptions)
        wait(for: [expectation])
        XCTAssertEqual(viewModel.dessertsFiltered.first?.name, expectResponse.meals.sorted {$0.name < $1.name}.first?.name)
        XCTAssertEqual(viewModel.isLoading, false)
        XCTAssertEqual(viewModel.isError, false)
    }
}

extension HomeViewModelTests {
    func getViewModel(service: DessertServiceProtocol = DessertServiceMock()) -> HomeViewModel {
        let provider = HomeProvider(service: service)
        let sut = HomeViewModel(provider: provider)
        return sut
    }
    
    private var dessertService: DessertServiceProtocol {
        DessertServiceMock()
    }
}

extension DessertResponse {
    fileprivate static var responseTestMock: DessertResponse {
        DessertResponse(meals: mealsResponseMock)
    }
    
    fileprivate static var sortedList: [DessertMeailResponse] {
        mealsResponseMock.sorted { $0.name < $1.name }
    }
    
    fileprivate static var mealsResponseMock: [DessertMeailResponse] {
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
