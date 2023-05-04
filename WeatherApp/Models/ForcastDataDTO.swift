//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation
import UIKit

struct ForcastDataDTO: Codable {
        let icon: String
        let name: String
        let temp: String
        let humidity: String
        let uv: String
        let rain: String
        let pressure: String
        let sunset: String
        let sunrise: String

    enum CodingKeys: String, CodingKey {
        case icon
        case name
        case temp
        case humidity
        case uv
        case rain
        case pressure
        case sunset
        case sunrise
    }

    static func fromWeatherDto(dto: WeatherDataDTO) -> ForcastDataDTO {
        return ForcastDataDTO(
                icon: String(dto.fact.icon),
                name: String(dto.info.tzinfo.name),
                temp: String(dto.fact.temp),
                humidity: String(dto.fact.humidity),
                uv: String(dto.fact.uvIndex),
                rain: String(dto.fact.precProb),
                pressure: String(dto.fact.pressureMm),
                sunset: String(dto.forecasts[0].sunset),
                sunrise: String(dto.forecasts[0].sunrise)
        )
    }
}
