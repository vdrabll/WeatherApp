//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation

class WeatherPresenter: WeatherPresenterProtocol {

    var networkService = WeatherNetworkServices()
    var view: WeatherMainViewProtocol?

    init(view: WeatherMainViewProtocol ) {
        self.view = view
    }
    
    
    func sendForcastData(complitionHandler: @escaping (ForcastDataDTO) -> ()) {
        networkService.getWeatherData { WeatherDataDTO in
            let data = ForcastDataDTO(icon: String(WeatherDataDTO.fact.icon),
                    name:String(WeatherDataDTO.info.tzinfo.name) ,
                    temp: String(WeatherDataDTO.fact.temp),
                    humidity: String(WeatherDataDTO.fact.humidity),
                    uv: String(WeatherDataDTO.fact.uvIndex),
                    rain: String(WeatherDataDTO.fact.precProb),
                    pressure: String(WeatherDataDTO.fact.pressureMm),
                    sunset: String(WeatherDataDTO.forecasts[0].sunset),
                    sunrise: String(WeatherDataDTO.forecasts[0].sunrise))
            complitionHandler(data)
        }
    }
}
