//
//  WeatherLocationLable.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit

class WeatherLocationLable: UIView {
    var locationName: UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Penza"
        lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
        return lable
    }()
    
    var locationTempruture: UILabel = {
        var lable = UILabel()
        lable.text = "22"
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "Poppins-SemiBold", size: 30)
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
        
        locationName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        locationName.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        locationTempruture.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        locationTempruture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
    }
}
