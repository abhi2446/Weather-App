//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 16/09/23.
//

import Foundation
import SwiftUI
import UIKit

class HomeViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var currentWeatherData : CurrentWeatherModel?
    @Published var showAlert = false
    @Published var forecastData : WeatherForecastDataModel?
    
    //MARK: - Methods
    func getCurrentWeather(searchCity : String){
        NetworkManager.shared.getCurrentWeatherDetails(queryParameter: searchCity) { currentWeatherData in
            
            DispatchQueue.main.async {
                if let weatherData = currentWeatherData {
                    self.currentWeatherData = weatherData
                } else if currentWeatherData == nil {
                    self.showAlert = true
                }
            }
        }
    }
    
    func getWeatherforeCast(){
        
        if let param = currentWeatherData?.name {
            NetworkManager.shared.getWeatherForecast(queryParameter:param) { forecastData in
                DispatchQueue.main.async {
                    if let forecastData = forecastData {
                        self.forecastData = forecastData
                    }
                }
            }
        }
    }
}
