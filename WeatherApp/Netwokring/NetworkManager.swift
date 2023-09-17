//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 16/09/23.
//

import Foundation


class NetworkManager {
    
    //MARK: - Properties
    var currentData : CurrentWeatherModel?
    var forecastData : WeatherForecastDataModel?
    
    //MARK: - Intialiser
    static let shared = NetworkManager()
    private init(){}
    
    //MARK: - Methods
    func getCurrentWeatherDetails(queryParameter : String,  completion : @escaping (CurrentWeatherModel?) -> Void) {
        
        let urlString = EnvironmentConfiguration.shared.makeCurrentWeatherUrl(parameter: queryParameter)
        guard let url = URL(string: urlString) else { return  }
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(CurrentWeatherModel.self, from: data)
                        self.currentData = result
                        print(result)
                        completion(result)
                        
                    } catch  {
                        print("Error while decoding response")
                        completion(nil)
                    }
                    
                }
            }
        }.resume()
    }

    func getWeatherForecast(queryParameter : String,completion : @escaping (WeatherForecastDataModel?) -> Void){
        
        let urlString = EnvironmentConfiguration.shared.makeWeatherForecastUrl(parameter: queryParameter)
        guard let url = URL(string: urlString) else { return  }
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                print(error.localizedDescription)
            }
            else{
                if let data = data {
                    do {
                        print(data)
                        let decodedResult = try JSONDecoder().decode(WeatherForecastDataModel.self, from: data)
                        self.forecastData = decodedResult
                        print(decodedResult)
                        completion(decodedResult)
                        
                    } catch  {
                        print("Error while decoding response")
                        completion(nil)
                    }
                    
                }
            }
        }.resume()
    }
}

