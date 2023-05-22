//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation
import Charts

final class WeatherPresenter: WeatherPresenterProtocol {
    
    private enum Constants {
        static let defoultLocation = Location(lat: 55.7522, lon: 37.6156)
    }
    private let networkService: NetworkService
    
    init() {
        self.networkService = NetworkService()
    }
    
    func sendForcastData(complitionHandler: @escaping (ForcastDataDTO, [BarChartDataEntry]) -> (),
                         location: Location = Constants.defoultLocation ) {
        networkService.getWeatherData(complitionHandler: { dto in
            let xy = dto.forecasts[0].hours.map { perHour in
                self.toXY(perHour: perHour)
            }
            complitionHandler(ForcastDataDTO.fromWeatherDto(dto: dto), xy)
        }, location: location)
    }
    
    private func toXY(perHour: Hour) -> BarChartDataEntry {
        return BarChartDataEntry(x: Double(perHour.hour)!, y: Double(perHour.temp))
    }
}
