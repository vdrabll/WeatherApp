//
//  WeatherLocationLable.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit

final class WeatherLocationLable: UIView {
    private enum Constants {
        static let font = "TimesNewRomanPSMT"
        static let tempSize: CGFloat = 100
        static let nameSize: CGFloat = 38
        
    }
    
    var locationName: UILabel = {
        var lable = UILabel()
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: Constants.font, size: Constants.nameSize)
        return lable
    }()
    
    var locationTempruture: UILabel = {
        var lable = UILabel()
        lable.textAlignment = .center
        lable.font = UIFont(name: Constants.font, size: Constants.tempSize)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension WeatherLocationLable {
    func setupSubviews() {
        addSubview(locationName)
        addSubview(locationTempruture)
        
        locationName.widthAnchor.constraint(equalToConstant: 190).isActive = true
        locationName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        locationName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        locationName.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        locationName.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        locationTempruture.topAnchor.constraint(equalTo: locationName.bottomAnchor).isActive = true
        locationTempruture.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        locationTempruture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        locationTempruture.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
    }
}
