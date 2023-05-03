
//  WeatherLocationProvider.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 03.05.2023.
//

import Foundation
import CoreLocation

class WeatherLocationProvider {

    private var locationManager: CLLocationManager?


    init(delegate: AppDelegate) {
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = delegate
        // config lcation manager
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
}

