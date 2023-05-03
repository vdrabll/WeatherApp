//
// Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit
import SVGKit

class WeatherViewController: UIViewController, WeatherMainViewProtocol {
    
    var presenter: WeatherPresenterProtocol?
    var weatherView: WeatherView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSubview()
        
    }
    
    private func setupSubview() {
        presenter?.sendForcastData(complitionHandler: { dto in
            let url = URL(string: String(format: "https://yastatic.net/weather/i/icons/funky/dark/%ы.svg", dto.icon))
            let image = SVGKImage(contentsOf: url).uiImage
            var weatherView = WeatherView(image: image!,
                                           name: dto.name,
                                           temp: dto.temp,
                                           humidity: dto.humidity,
                                           uv: dto.uv,
                                           rain: dto.rain,
                                           pressure: dto.pressure,
                                           sunset: dto.sunset,
                                           sunrise: dto.sunrise)
            self.view.addSubview(weatherView)
            weatherView.bounds = self.view.bounds
        })
    }
    
    private func setupPresenter() {
        self.presenter = WeatherPresenter(view: self.view as! WeatherMainViewProtocol)
    }
}
