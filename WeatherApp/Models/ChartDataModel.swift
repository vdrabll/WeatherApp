//
//  ChartDataModel.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation

struct ChartDataModel: Identifiable {
    var id = UUID()
    let temp: String
    let hour: String
}
