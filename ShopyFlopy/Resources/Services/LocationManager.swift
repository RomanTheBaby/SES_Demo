//
//  LocationManager.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    // MARK: - Properties
    
    static let shared = LocationManager()
    
    @Published private(set) var currentLocation: CLLocation?
    
    private let locationManager = CLLocationManager()

    // MARK: - Init
    
    override init() {
        super.init()
        currentLocation = locationManager.location
//        locationManager.allowsBackgroundLocationUpdates = true // TODO: Task to add background location tracking
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer // TODO: Make this a task somehow
//        locationManager.delegate = self // TODO: Make this is a task
    }
    
    // MARK: - Public Methods
    
    func startMonitoringUserLocation() {
        locationManager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = manager.location
    }
}
