//
//  WeatherInformationView.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 16/09/23.
//

import SwiftUI

struct WeatherInformationView: View {
    
    //MARK: - Properties
    @State var weatherInformation : CurrentWeatherModel
    
    //MARK: - View Builder
    var body: some View {
        HStack(spacing:12){
            
            VStack{
                if let temp = weatherInformation.main?.temp{
                    let temperature = String(temp)
                    Text("Temp")
                         .foregroundColor(.white.opacity(0.5))
                    Text(temperature+AppConstants.degreeCelsius)
                        .foregroundColor(.white)
                }
            }

            VStack{
                if let humidity = weatherInformation.main?.humidity {
                    let weatherHumdity = String(humidity)
                    Text("Humidity")
                        .foregroundColor(.white.opacity(0.5))
                    Text(weatherHumdity+"%")
                        .foregroundColor(.white)
                }
            }
            
            VStack{
                if let minTemp = weatherInformation.main?.tempMin {
                    let minimumTemp = String(minTemp)
                    Text("Min Temp")
                        .foregroundColor(.white.opacity(0.5))
                    Text(minimumTemp+AppConstants.degreeCelsius)
                        .foregroundColor(.white)
                        .bold()
                }
            }
            
            VStack{
                if let maxTemp = weatherInformation.main?.tempMax {
                    let maximumTemp = String(maxTemp)
                    Text("Max Temp")
                        .foregroundColor(.white.opacity(0.5))
                    Text(maximumTemp+AppConstants.degreeCelsius)
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
        .padding()
    }
}


