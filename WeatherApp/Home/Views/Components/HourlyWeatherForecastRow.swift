//
//  HourlyWeatherForecastRow.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 17/09/23.
//

import SwiftUI

struct HourlyWeatherForecastRow: View {
    
    //MARK: - Properties
    @State var forecastDataArray : [List]
    
    //MARK: - View Builder
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(forecastDataArray) { array in
                HStack(spacing : 0){
                    Image("Icon")
                        .resizable()
                        .frame(width: 56 , height: 56,alignment: .leading)
                        
                    Spacer().frame(width: 82)
                    VStack{
                        if let time = array.dt_txt , let temp = array.main?.temp {
                            let temperature = String(temp)
                            Text(time)
                            Text(temperature)
                        }
                    }.foregroundColor(.cyan)
                }
            }
            
            }
           
        }
    }

// MARK: - Previews
struct HourlyWeatherForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherForecastRow( forecastDataArray: [])
    }
}
