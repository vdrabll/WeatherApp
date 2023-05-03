//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation

class WeatherPresenter: WeatherPresenterProtocol {

    var networkService: NerworkServicesProtocol?
    var view: WeatherMainViewProtocol?

    init(view: WeatherMainViewProtocol ) {
        self.view = view
        self.networkService = WeatherNetworkServices()
    }
    
    
    func sendForcastData(complitionHandler: @escaping (ForcastDataDTO) -> ()) {
        networkService?.getWeatherData { dto in
            var forcast = ForcastDataDTO(icon: String(dto.fact.icon),
                    name:String(dto.info.tzinfo.name) ,
                    temp: String(dto.fact.temp),
                    humidity: String(dto.fact.humidity),
                    uv: String(dto.fact.uvIndex),
                    rain: String(dto.fact.precProb),
                    pressure: String(dto.fact.pressureMm),
                    sunset: String(dto.forecasts[0].sunset),
                    sunrise: String(dto.forecasts[0].sunrise))
            complitionHandler(forcast)
        }
    }
}
