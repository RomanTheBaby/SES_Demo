//
//  WeatherService.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation
import CoreLocation

class WeatherService {
    
    private let decoder: JSONDecoder
    private let networkService: NetworkService
    
    init() {
        networkService = NetworkService()
        decoder = JSONDecoder()
        // TODO: Task where to add this as task
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetchWeather(_ weatherUpdateHandler: @escaping ((WeatherInformation) -> Void)) {
        guard let currentCoordinates = LocationManager.shared.currentLocation?.coordinate else {
            return
        }
        
        let requestString = "https://www.weatherspier.com?latitude=\(currentCoordinates.latitude)&latitude=\(currentCoordinates.latitude)"
        let url = URL(string: requestString)!
        // TODO: add weak self as task??
        networkService.makeRequest(URLRequest(url: url)) { data, error in
            if let data, let weatherInfo: WeatherInformation = self.parseInfo(from: data) {
                weatherUpdateHandler(weatherInfo)
            }
        }
    }
    
    func fetchWeather() async throws -> WeatherInformation? {
        guard let currentCoordinates = LocationManager.shared.currentLocation?.coordinate else {
            return nil
        }
        
        let requestString = "https://www.weatherspier.com?latitude=\(currentCoordinates.latitude)&latitude=\(currentCoordinates.latitude)"
        let url = URL(string: requestString)!
        // TODO: add weak self as task??
        let data = try await networkService.makeRequest(URLRequest(url: url))
        return try! decoder.decode(WeatherInformation.self, from: data)
    }
    
    func fetchHourlyForecast(_ completion: (() -> Void)) {
        
    }
    
    private func parseInfo(from data: Data) -> WeatherInformation? {
        // TODO: parse this later
        try? decoder.decode(WeatherInformation.self, from: data)
    }
    
}
