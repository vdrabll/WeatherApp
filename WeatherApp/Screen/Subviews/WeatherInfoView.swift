//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit

class WeatherInfoView: UIStackView {
    var weatherHumidity: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = 2
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Влаж. \n"
        lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
        return lable
    }()
    
    var weatherUV: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = 2
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "УФ \n"
        lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
        return lable
    }()
    
    var weatherRain: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = 2
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Дождь % \n"
        lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
        return lable
    }()
    
    var weatherPressure: UILabel = {
        var lable = UILabel()
        lable.numberOfLines = 2
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Давление \n"
        lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
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
