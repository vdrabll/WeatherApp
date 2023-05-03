//
// Created by Виктория Федосова on 02.05.2023.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    
    var weatherView = WeatherView(image: <#T##UIImage#>, name: <#T##String#>, temp: <#T##String#>, humidity: <#T##String#>, uv: <#T##String#>, rain: <#T##String#>, pressure: <#T##String#>, sunset: <#T##String#>, sunrise: <#T##String#>)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension WeatherViewController {
    func setupSubview() {
        self.view.addSubview(weatherView)
        weatherView.bounds = view.bounds
    }
}
