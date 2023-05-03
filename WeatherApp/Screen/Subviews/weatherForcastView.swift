//
//  weatherForcastView.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import SwiftUI
import Charts
import UIKit

class weatherForcastView: UIView {
    
   private var sectionNameLable : UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Погода на сегодня"
        lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
        return lable
    }()
    
    var sunsetTimeLable: UILabel = {
         var lable = UILabel()
         lable.translatesAutoresizingMaskIntoConstraints = false
         lable.text = "Время заката"
         lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
         return lable
     }()
    
    var sunriseTimeLable : UILabel = {
         var lable = UILabel()
         lable.translatesAutoresizingMaskIntoConstraints = false
         lable.text = "Время восхода"
         lable.font = UIFont(name: "Poppins-SemiBold", size: 15)
         return lable
     }()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension weatherForcastView {
    func setupSubview() {
        addSubview(sectionNameLable)
        addSubview(sunsetTimeLable)
        addSubview(sunsetTimeLable)
        
        sectionNameLable.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sectionNameLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12 ).isActive = true
        
        sunsetTimeLable.widthAnchor.constraint(equalToConstant: 109).isActive = true
        
        sunsetTimeLable.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        sunsetTimeLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        sunsetTimeLable.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
        sunriseTimeLable.widthAnchor.constraint(equalToConstant: 139).isActive = true
        sunriseTimeLable.heightAnchor.constraint(equalToConstant: 15).isActive = true
        sunriseTimeLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        sunriseTimeLable.topAnchor.constraint(equalTo: topAnchor, constant: 199).isActive = true
        
    }
}
