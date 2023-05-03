//
//  WeatherNetworkServices.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation

class WeatherNetworkServices {
    private enum Constants {
        static let url = String( "https://api.weather.yandex.ru/v2/forecast?lat=%s&lon=%s&lang=ru_RU&limit=3&hours=true&extra=true")
        static let key = "efb61685-c9ea-4e32-8ec7-13d14891d8c5"
        static let fieldName = "X-Yandex-API-Key"
    }
    
    init() {
        
    }
    
    func getWeatherData(complitionHandler: @escaping (WeatherDataDTO) -> ()) {
        var request = URLRequest(url: URL(string: String(format: Constants.url, "", ""))!)
        request.addValue(Constants.key, forHTTPHeaderField: Constants.fieldName)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode == 200 {
                        do {
                             let parsedData = try JSONDecoder().decode(WeatherDataDTO.self, from: data!)
                            complitionHandler(parsedData)
                        } catch {
                            print(String(error.localizedDescription))
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
