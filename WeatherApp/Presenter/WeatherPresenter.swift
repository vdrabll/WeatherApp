//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation

class WeatherPresenter: WeatherPresenterProtocol {
    var networkService = WeatherNetworkServices()
    func sendForcastData(complitionHandler: @escaping (ForcastDataDTO) -> ()) {
        networkService.getWeatherData { dto in
            complitionHandler(ForcastDataDTO.fromWeatherDto(dto: dto))
        }
    }


}
