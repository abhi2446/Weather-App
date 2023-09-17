//
//  UrlConfiguration.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary on 16/09/23.
//

import Foundation
 
class EnvironmentConfiguration {
    
    //MARK: - Intialiser
    static let shared = EnvironmentConfiguration()
    private init(){}
    
    //MARK: - Methods
    func makeCurrentWeatherUrl(parameter : String) -> String {
        let currentWeatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(parameter)&appid=\(AppConstants.apiKey)&units=metric"
        return currentWeatherUrl
    }
    
    func makeWeatherForecastUrl(parameter : String) -> String {
        let weatherForecastUrl = "https://api.openweathermap.org/data/2.5/forecast?q=\(parameter)&appid=\(AppConstants.apiKey)&units=metric"
        return weatherForecastUrl
    }
 
}
