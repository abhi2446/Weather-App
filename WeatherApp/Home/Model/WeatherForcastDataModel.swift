//
//  WeatherForcastDataModel.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 17/09/23.
//

import Foundation

struct WeatherForecastDataModel : Codable {
    let cod: String
    let message, cnt: Int
    let list : [List]?
}

struct List : Codable , Identifiable{
    let id : UUID
    let main :  Main?
    let dt_txt : String?
}

struct Main : Codable {
    let temp : Double?
}
