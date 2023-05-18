//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit

final class WeatherInfoView: UIStackView {
    
    private enum Constants {
        static let font =  "TimesNewRomanPSMT"
        static let number = 2
        static let size: CGFloat = 15
        static let humidity = "Влаж. \n"
        static let uv = "УФ \n"
        static let rain = "Дождь % \n"
        static let pressure = "Давление \n"
        
    }
    
    var weatherHumidity: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = Constants.number
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.humidity
        lable.font = UIFont(name: Constants.font,size: Constants.size)
        return lable
    }()
    
    var weatherUV: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = Constants.number
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.uv
        lable.font = UIFont(name: Constants.font,size: Constants.size)
        return lable
    }()
    
    var weatherRain: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = Constants.number
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.rain
        lable.font = UIFont(name: Constants.font,size: Constants.size)
        return lable
    }()
    
    var weatherPressure: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = Constants.number
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.pressure
        lable.font = UIFont(name: Constants.font,size: Constants.size)
        return lable
    }()
    
    init() {
        super.init(frame: .zero)
        setupStackView()
        setupSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        spacing = 0
        alignment = .fill
        axis = .horizontal
        distribution = .equalCentering
    }
}

private extension WeatherInfoView {
    func setupSubviews() {
        addArrangedSubview(weatherHumidity)
        addArrangedSubview(weatherUV)
        addArrangedSubview(weatherRain)
        addArrangedSubview(weatherPressure)
    }
}
