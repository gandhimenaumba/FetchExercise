//
//  NetworkService.swift
//  FetchExercise
//
//  Created by gandhi mena on 8/9/23.
//

import Combine
//import Dependencies
import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func request<T>(_ endpoint: Endpoints) -> AnyPublisher<T, NetworkError> where T: Decodable
}

final class NetworkService: NetworkServiceProtocol {
    
    func request<T>(_ endpoint: Endpoints) -> AnyPublisher<T, NetworkError> where T : Decodable {
        getURLRequest(endpoint: endpoint)
        |> urlSessionRequest
    }
    
    private func urlSessionRequest<T: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<T, NetworkError> {
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .print()
            .tryMap(manageData)
            .mapError(handleError)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError(manageDecodeError)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private func manageData(_ serviceResponse: (Data, URLResponse)) throws -> Data {
        print(serviceResponse.0.prettyPrintedJSONString)
        
        switch NetworkValidator.castToHTTPURLResponse(serviceResponse.1) {
        case let .success(response):
            switch response.status {
            case .success: return serviceResponse.0
            default: throw handleServerError(response, errorData: serviceResponse.0)
            }
        case let .failure(error):
            throw error
        }
    }
    
    private func handleServerError(_ response: HTTPURLResponse, errorData: Data) -> NetworkError {
        switch response.status {
        case .badRequest:
            return .badRequest(getFinalErrorType(errorData: errorData))
        case .failed, .redirect:
            return .failed
        case .success:
            return .success
        case .unableTpDecode:
            return .decodingFailed(response.debugDescription)
        case .unauthorized:
            return .authError(getFinalErrorType(errorData: errorData))
        }
    }
    
    private func getFinalErrorType(errorData: Data) -> NetworkRequestError {
        getErrorData(errorData)
        |> getErrorType
    }
    
    private func getErrorData(_ dataError: Data) -> Decodable? {
        if let genericError = try?  JSONDecoder().decode(NetworkErrorData.self, from: dataError) {
            return genericError
        } else {
            return nil
        }
    }
    
    private func getErrorType(_ errorObject: Decodable?) -> NetworkRequestError {
        guard let errorObject = errorObject else { return .unknown }
        switch errorObject {
        case is NetworkErrorData:
            return getErrorDataType(errorObject as? NetworkErrorData)
        default:
            return .unknown
        }
    }
    
    private func getErrorDataType(_ errorData: NetworkErrorData?) -> NetworkRequestError {
        guard let error = errorData else { return .unknown }
        return .genericError(error.message)
    }
    
    private func handleError(_ error: Error) -> NetworkError {
        guard let error = error as? NetworkError else {
            return .serverError
        }
        return error
    }
    
    private func getURLRequest(endpoint: Endpoints) -> URLRequest {
        let url = URL(string: endpoint.getService.baseURL) ?? URL(string: "urlFial")!
        var urlComponent = URLComponents(url: url, resolvingAgainstBaseURL: true) ?? URLComponents()
        urlComponent.queryItems = endpoint.getService.queryItems
        var urlRequest = URLRequest(url: urlComponent.url ?? URL(string: "urlFial")!)
        endpoint.getService.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        urlRequest.httpMethod = endpoint.getService.method.rawValue
        urlRequest.httpBody = endpoint.getService.parameters.data
        print(urlRequest.url?.absoluteString ?? "")
        return urlRequest
    }
    
    private func manageDecodeError(_ error: Error) -> NetworkError {
        print("DECODING ERROR: \(error)")
        guard let errors = error as? NetworkError else { return NetworkError.decodingFailed(error.localizedDescription) }
        return errors
    }
    
}
