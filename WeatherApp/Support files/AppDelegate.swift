//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Виктория Федосова on 02.05.2023.
//
//

import UIKit
import CoreLocation


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var locationManager: WeatherLocationProvider?
    static var subscribers: [(CLLocation) -> Void] = []
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        locationManager = WeatherLocationProvider(delegate: self)
        locationManager?.requestAuthorization()
    // Override point for customization after application launch.
    return true
    }

    static func subscribe(subscriber: @escaping (CLLocation) -> Void) -> Void {
        subscribers.append(subscriber)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //  как то в обьект провайдера запихнуть 1 обьект из массива локаций и остановить запрос локациц
        if nil != locations && !locations.isEmpty {
            // засовываю обьект туд
            AppDelegate.subscribers.forEach {
                subscriber in subscriber(locations.first!)
            }
        } else {
            //return defoult
        }
        locationManager?.stopUpdatingLocation()
    }
}
