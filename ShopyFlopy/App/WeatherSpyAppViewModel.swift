//
//  WeatherSpyAppViewModel.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-07-03.
//

import Foundation
import Combine

class WeatherSpyAppViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var weatherInfomation: WeatherInformation?
    private var weatherService = WeatherService()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    
    override init() {
        super.init()
        
        LocationManager.shared.$currentLocation.sink(receiveValue: { updatedLocation in
            Task {
                try await self.fetchWeather()
            }
        }).store(in: &self.cancellables)
    }
    
    // MARK: - Public Methods
    
    func fetchWeather() async throws {
        self.weatherInfomation = try? await weatherService.fetchWeather()
    }
    
}
