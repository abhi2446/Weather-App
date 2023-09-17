//
//  CurrentWeatherModel.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 16/09/23.
//

import Foundation

struct CurrentWeatherModel : Codable {
    
    let main : WeatherInformation?
    let wind : Wind?
    let name : String?
}

struct  WeatherInformation : Codable {
    let temp : Double?
    let feelsLike : Double?
    let tempMin : Double?
    let tempMax : Double?
    let humidity : Double?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin   = "temp_min"
        case tempMax   = "temp_max"
        case humidity
    }
}

struct Wind : Codable {
    
    let speed : Double?
    let deg : Double?
}
