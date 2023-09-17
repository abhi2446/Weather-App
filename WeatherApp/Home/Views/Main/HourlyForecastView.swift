//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 16/09/23.
//

import SwiftUI

struct HourlyForecastView: View {
    
    //MARK: - Properties
    @ObservedObject var viewModel : HomeViewModel
    @State var forecastDataArray : [List]?
    
    //MARK: - View Builder
    var body: some View {
        ZStack{
            if let forecastData = forecastDataArray {
                HourlyWeatherForecastRow(forecastDataArray: forecastData)
            }
   
        }.frame(width: AppConstants.screenWidth , height: AppConstants.screenHeight)
            .background(
                Color.black
            )
            .onAppear{
                viewModel.getWeatherforeCast()
                DispatchQueue.main.async {
                    if let forecastData = viewModel.forecastData?.list{
                        self.forecastDataArray = forecastData
                    }
                }
            }
    }
}

//MARK: - Previews
struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView(viewModel: HomeViewModel())
    }
}
