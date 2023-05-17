//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation
import Charts

protocol WeatherPresenterProtocol {
    func sendForcastData(complitionHandler: @escaping (ForcastDataDTO, [BarChartDataEntry]) -> (), location: Location)
}
