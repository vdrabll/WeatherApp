//
// Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit
import SVGKit

import CoreLocation
import Charts

class WeatherViewController: UIViewController {
    
    private enum Constants {
        static let stringFormat = "https://yastatic.net/weather/i/icons/funky/dark/%@.svg"
    }
    
    private var presenter: WeatherPresenterProtocol?
    private var locationProvider: LocationManagerProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = WeatherPresenter()
        self.locationProvider = LocationManagerProvider(delegate: self)
        self.locationProvider?.requestAuthorization()
        self.locationProvider?.requestLocation()
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func addWeatherView(dto: ForcastDataDTO, entry: [BarChartDataEntry]) {
        let url = URL(string: String(format: Constants.stringFormat , dto.icon))
        let image = SVGKImage(contentsOf: url).uiImage
        
        DispatchQueue.main.async {
            let weatherView = WeatherView(image: image!,
                                          name: dto.name,
                                          temp: dto.temp,
                                          humidity: dto.humidity,
                                          uv: dto.uv,
                                          rain: dto.rain,
                                          pressure: dto.pressure,
                                          sunset: dto.sunset,
                                          sunrise: dto.sunrise,
                                          entry: entry )
            self.view.addSubview(weatherView)
            weatherView.translatesAutoresizingMaskIntoConstraints = false
            weatherView.bounds = self.view.bounds
        }
    }
    
}

extension WeatherViewController: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty {
            let location = Location(lat: locations[0].coordinate.latitude, lon: locations[0].coordinate.longitude)
            presenter!.sendForcastData(complitionHandler: self.addWeatherView, location: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error location manager:: \(error.localizedDescription)")
    }
}
