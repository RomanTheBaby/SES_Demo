//
//  LocationManager.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var currentLocation: CLLocation? {
        locationManager.location
    }
    
    private let locationManager = CLLocationManager()
    
    static let shared = LocationManager()
    
    override init() {
        super.init()
//        locationManager.allowsBackgroundLocationUpdates = true // TODO: Task to add background location tracking
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }
    
    func startMonitoringUserLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
}
