//
//  WeatherService.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation
import CoreLocation

class WeatherService {
    
    private let networkService: NetworkService
    
    init() {
        networkService = NetworkService()
        // TODO: Task where to add this as task
        //        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchWeather() async throws -> WeatherInformation {
        guard let currentCoordinates = LocationManager.shared.currentLocation?.coordinate else {
            fatalError("We do not have device location, this should never happen")
        }
        
        let requestString = "https://www.weatherspier.com?latitude=\(currentCoordinates.latitude)&latitude=\(currentCoordinates.latitude)"
        let url = URL(string: requestString)!
        let urlRequest = URLRequest(url: url)
        return try await withCheckedThrowingContinuation { continuation in
            networkService.makeRequest(urlRequest) { data, error in
                //                let weatherInfo = try! self.decoder.decode(WeatherInformation.self, from: data!)
                let hardcodedInfo = WeatherInformation(
                    cityName: "City",
                    temperature: "20º",
                    title: "Partly Cloudly",
                    description: "Slightly humid with gentle breeze of wind"
                )
                continuation.resume(returning: hardcodedInfo)
            }
        }
        
        //        return try await networkService.makeRequest(URLRequest(url: url))
    }
    
    func fetchHourlyForecast(_ completion: (() -> Void)) {
        
    }
    
}
