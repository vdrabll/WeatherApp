//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation

protocol NerworkServicesProtocol {
    func getWeatherData(complitionHandler: @escaping (WeatherDataDTO) -> ())
}
