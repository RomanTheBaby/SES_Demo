//
//  NetworkService.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation

class NetworkService {
    
    private let decoder: JSONDecoder

    init() {
        decoder = JSONDecoder()
    }
    
    func makeRequest(_ urlRequest: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        // TODO: Adding this is a task
//        let hardcodedInfo = WeatherInformation(
//            cityName: "City",
//            temperature: "20º",
//            title: "Partly Cloudly",
//            description: "Slightly humid with gentle breeze of desparation because it's monday"
//        )
//        completion(try! JSONEncoder().encode(hardcodedInfo), nil)
        // TODO: make a request somehow?
    }
    
    func makeRequest<ResponseModel: Codable>(_ urlRequest: URLRequest) async throws -> ResponseModel {
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try decoder.decode(ResponseModel.self, from: data)
    }
}
