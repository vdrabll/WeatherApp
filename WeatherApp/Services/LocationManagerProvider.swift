
//  LocationProvider.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 03.05.2023.
//

import Foundation
import CoreLocation

class LocationManagerProvider {
    private var locationManager: CLLocationManager?
    
    init(delegate: CLLocationManagerDelegate) {
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = delegate
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyKilometer
    }
    
    public func requestLocation() {
        self.locationManager?.requestLocation()
    }
    
    public func requestAuthorization() {
        self.locationManager?.requestAlwaysAuthorization()
    }
    
    func stopUpdatingLocation() {
        self.locationManager?.stopUpdatingLocation()
    }
    
    func getLocation() -> CLLocation? {
        self.locationManager!.location
    }
}

