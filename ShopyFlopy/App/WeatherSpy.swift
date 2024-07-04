//
//  WeatherSpy.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-07-03.
//

import SwiftUI

@main
struct WeatherSpyApp: App {
    
    private var viewModel = WeatherSpyAppViewModel()
    
    init() {
        LocationManager.shared.startMonitoringUserLocation()
    }
    
    var body: some Scene {
        WindowGroup {
            if let weatherInfomation = viewModel.weatherInfomation {
                WeatherView(weatherInformation: weatherInfomation)
            } else {
                // TODO: Display loading indicator or text or something like that
                EmptyView()
                    .task {
                        try? await viewModel.fetchWeather()
                    }
            }
        }
    }
}
