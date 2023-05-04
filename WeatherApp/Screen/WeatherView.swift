//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit

class WeatherView: UIView {
    var weatherLable = WeatherLocationLable()
    var weatherInfo =  WeatherInfoView()
    var weathetForcast = weatherForcastView()
     var weatherIcon = UIImageView()


    init(image: UIImage, name: String, temp: String, humidity: String,
         uv: String, rain: String, pressure: String, sunset: String, sunrise: String) {
        super.init(frame: .zero)
        setupSubviews()
        backgroundColor = .white
        weatherIcon.image = image
        weatherLable.locationName.text = name
        weatherLable.locationTempruture.text = temp
        weatherInfo.weatherHumidity.text! += humidity
        weatherInfo.weatherUV.text! += uv
        weatherInfo.weatherRain.text! += rain
        weatherInfo.weatherPressure.text! += pressure
        weathetForcast.sunriseTimeLable.text! += sunrise
        weathetForcast.sunsetTimeLable.text! += sunset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension WeatherView {
    func setupSubviews() {
        addSubview(weatherIcon)
        addSubview(weatherLable)
        addSubview(weatherInfo)
        
        weatherIcon.translatesAutoresizingMaskIntoConstraints = false
        weatherIcon.widthAnchor.constraint(equalToConstant: 147).isActive = true
        weatherIcon.heightAnchor.constraint(equalToConstant: 132).isActive = true
        weatherIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 114).isActive = true
        weatherIcon.topAnchor.constraint(equalTo: topAnchor, constant: 80).isActive = true
        
        weatherLable.translatesAutoresizingMaskIntoConstraints = false
        weatherLable.widthAnchor.constraint(equalToConstant:200).isActive = true
        weatherLable.heightAnchor.constraint(equalToConstant: 150).isActive = true
        weatherLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 90).isActive = true
        weatherLable.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
        
        weatherInfo.translatesAutoresizingMaskIntoConstraints = false
        weatherInfo.widthAnchor.constraint(equalToConstant: 327).isActive = true
        weatherInfo.heightAnchor.constraint(equalToConstant: 59).isActive = true
        weatherInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        weatherInfo.topAnchor.constraint(equalTo: topAnchor, constant: 370).isActive = true
    }
}
