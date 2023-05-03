//
// Created by Виктория Федосова on 03.05.2023.
//

import Foundation
import UIKit

struct ForcastDataDTO: Decodable {
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
}
