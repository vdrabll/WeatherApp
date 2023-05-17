//
//  NetworkServices.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import CoreLocation

class NetworkService: NerworkServicesProtocol {
    
    private enum Constants {
        static let url = "https://api.weather.yandex.ru/v2/forecast?lat=%f&lon=%f&lang=ru_RU&limit=1&hours=true&extra=true"
        static let key = "efb61685-c9ea-4e32-8ec7-13d14891d8c5"
        static let fieldName = "X-Yandex-API-Key"
    }
    
    func getWeatherData(complitionHandler: @escaping (WeatherDataDTO) -> (), location: Location) {
        let url = URL(string: String(format: Constants.url, location.lat, location.lon))
        var request = URLRequest(url: url!)
        request.addValue(Constants.key, forHTTPHeaderField: Constants.fieldName)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode == 200 {
                        do {
                            let parsedData: WeatherDataDTO = try JSONDecoder().decode(WeatherDataDTO.self, from: data!)
                            complitionHandler(parsedData)
                        } catch {
                            print(String(describing: error))
                        }
                    } else {
                        print(httpResponse.statusCode)
                    }
                }
            }
        }
        task.resume()
    }
}
