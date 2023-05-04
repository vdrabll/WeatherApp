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
        lable.backgroundColor = .blue
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont(name: "Poppins-SemiBold", size: 30 )
        return lable
    }()
    
    var locationTempruture: UILabel = {
        var lable = UILabel()
        lable.backgroundColor = .blue
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
        self.backgroundColor = .darkGray
        
        locationName.widthAnchor.constraint(equalToConstant: 190).isActive = true
        locationName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        locationName.topAnchor.constraint(equalTo: topAnchor).isActive = true
        locationName.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        locationName.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        locationTempruture.widthAnchor.constraint(equalToConstant: 120).isActive = true
        locationTempruture.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
