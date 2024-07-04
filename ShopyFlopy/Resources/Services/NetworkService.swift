//
//  NetworkService.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation

class NetworkService {
    
    func makeRequest(_ urlRequest: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        // TODO: Adding this is a task
        let hardcodedInfo = WeatherInformation(
            cityName: "City",
            temperature: "20º",
            title: "Partly Cloudly",
            description: "Slightly humid with gentle breeze of desparation because it's monday"
        )
        completion(try! JSONEncoder().encode(hardcodedInfo), nil)
    }
    
    func makeRequest(_ urlRequest: URLRequest) async throws -> Data {
        // TODO: Adding this is a task
        let hardcodedInfo = WeatherInformation(
            cityName: "City",
            temperature: "20º",
            title: "Partly Cloudly",
            description: "Slightly humid with gentle breeze of desparation because it's monday"
        )
        return try! JSONEncoder().encode(hardcodedInfo)
    }
    
}
