//
//  weatherForcastView.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import Charts
import UIKit

class weatherForcastView: UIView, ChartViewDelegate {
    private enum Constants {
        static let smallSize: CGFloat = 20
        static let largeSize: CGFloat = 25
        static let textFont = "Times New Roman"
        static let sectionNameText = "Погода на сегодня"
        static  let sunsetTimeText =  "Время заката: "
        static  let sunriseTimeText =  "Время восхода: "
    }
    
    private var sectionNameLable : UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.sectionNameText
        lable.font = UIFont(name:Constants.textFont , size: Constants.largeSize)
        return lable
    }()
    
    var forcastChart = BarChartView()
    
    var sunsetTimeLable: UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.sunsetTimeText
        lable.font = UIFont(name: Constants.textFont, size: Constants.smallSize)
        return lable
    }()
    
    var sunriseTimeLable : UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.sunriseTimeText
        lable.font = UIFont(name: Constants.textFont, size: Constants.smallSize)
        return lable
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension weatherForcastView {
    func setupSubview() {
        addSubview(sectionNameLable)
        addSubview(sunsetTimeLable)
        addSubview(sunriseTimeLable)
        addSubview(forcastChart)
        
        sectionNameLable.widthAnchor.constraint(equalToConstant: 250).isActive = true
        sectionNameLable.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sectionNameLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 23).isActive = true
        sectionNameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 450).isActive = true
        
        forcastChart.translatesAutoresizingMaskIntoConstraints = false
        forcastChart.widthAnchor.constraint(equalToConstant: 350).isActive = true
        forcastChart.heightAnchor.constraint(equalToConstant: 250).isActive = true
        forcastChart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        forcastChart.topAnchor.constraint(equalTo: self.topAnchor, constant: 500).isActive = true
        
        sunriseTimeLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sunriseTimeLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sunriseTimeLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17).isActive = true
        sunriseTimeLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 750).isActive = true
        
        sunsetTimeLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sunsetTimeLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sunsetTimeLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17).isActive = true
        sunsetTimeLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 780).isActive = true
    }    
}
