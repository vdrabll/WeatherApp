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
        static let textSize: CGFloat = 15
        static let textFont = "Times New Roman"
        static let sectionNameText = "Погода на сегодня"
        static  let sunsetTimeText =  "Время заката"
        static  let sunriseTimeText =  "Время восхода"
    }
   private var sectionNameLable : UILabel = {
        var lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = Constants.sectionNameText
        lable.font = UIFont(name:Constants.textFont , size: Constants.textSize)
        return lable
    }()
    
    var sunsetTimeLable: UILabel = {
         var lable = UILabel()
         lable.translatesAutoresizingMaskIntoConstraints = false
         lable.text = Constants.sunsetTimeText
         lable.font = UIFont(name: Constants.textFont, size: Constants.textSize)
         return lable
     }()
    
    var sunriseTimeLable : UILabel = {
         var lable = UILabel()
         lable.translatesAutoresizingMaskIntoConstraints = false
         lable.text = Constants.sunriseTimeText
         lable.font = UIFont(name: Constants.textFont, size: Constants.textSize)
         return lable
     }()
    
    var forcastChart = LineChartView()
    
    init() {
        super.init(frame: .zero)
        setupSubview()
        setupChart()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupChart() {
        // setup chart here Barchartdata(BarchartDataset:(entries: <#T##[ChartDataEntry]?#>)
        let set = BarChartDataSet()
        set.colors = ChartColorTemplates.vordiplom()
    }
}

private extension weatherForcastView {
    func setupSubview() {
        addSubview(sectionNameLable)
        addSubview(sunsetTimeLable)
        addSubview(sunsetTimeLable)
        addSubview(forcastChart)
        
        
    }
}
