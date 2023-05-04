//
//  NetworkServices.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//

import Foundation

class WeatherNetworkServices: NerworkServicesProtocol {

    private enum Constants {
        static let url = "https://api.weather.yandex.ru/v2/forecast?lat=%@&lon=%@&lang=ru_RU&limit=3&hours=true&extra=true"
        static let key = "efb61685-c9ea-4e32-8ec7-13d14891d8c5"
        static let fieldName = "X-Yandex-API-Key"
        
    }
    
    init() {
    }
    
    func getWeatherData(complitionHandler: @escaping (WeatherDataDTO) -> ()) {
        let lat = "53.195"
        let lon = "45.017"
        let url = URL(string: String(format: Constants.url, lat, lon))
        var request = URLRequest(url: url!)
        request.addValue(Constants.key, forHTTPHeaderField: Constants.fieldName)
        AppDelegate.subscribe { location in
            print(location)
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
                if let httpResponse = response as? HTTPURLResponse{
                    if httpResponse.statusCode == 200 {
                        do {
                            let parsedData = try JSONDecoder().decode(WeatherDataDTO.self, from: data!)
                            complitionHandler(parsedData)
                        } catch {
                            print(String(describing: error))
                        }
                    }
                }
            }
        }
        task.resume()
    }
}
