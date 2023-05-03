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

    var locationManager = CLLocationManager()
    // место для провайдера
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()

    // Override point for customization after application launch.
    return true
    }


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
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
        if locations != nil {
            // засовываю обьект туда
            locationManager.stopUpdatingLocation()
        }
    }
}
