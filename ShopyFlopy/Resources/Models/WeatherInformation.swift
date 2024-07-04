//
//  WeatherInformation.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation

struct WeatherInformation: Codable {
    var cityName: String
    var temperature: String
    var title: String
    var description: String
    var backgroundImageURL: URL? = nil
    
    var hourlyData: [HourlyData]?
    
    struct HourlyData: Codable {
        var time: String
        var imageName: String
        var temperature: String
    }
}
