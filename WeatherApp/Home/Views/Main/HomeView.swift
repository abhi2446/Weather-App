//
//  HomeView.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary  on 16/09/23.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Properties
    @State private var searchText : String = ""
    @StateObject var viewModel = HomeViewModel()
    
    //MARK: - View Builder
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    GreetingView()
                    CustomSearchBar(searchText: $searchText)
                        .onSubmit {
                            print(searchText)
                            viewModel.getCurrentWeather(searchCity: searchText)
                            searchText = ""
                        }
                        .padding()
                    Image("Icon")
                        .resizable()
                        .frame(width: AppConstants.screenWidth - 64,height: AppConstants.screenHeight/3)
                        .padding()
                    if let currentWeatherData = viewModel.currentWeatherData {
                        Text(currentWeatherData.name ?? "")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        WeatherInformationView(weatherInformation: currentWeatherData)
                    }

                    NavigationLink {
                        HourlyForecastView(viewModel: viewModel)
                    } label: {
                        if viewModel.currentWeatherData != nil {
                            Text("View Hourly Forcast")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.headline)
                                .fontWeight(.semibold)
                                .underline(true , color: .white.opacity(0.5))
                        }
                    }  
                }
            }  .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
                .background(
                    Color(.black)
                )
                .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text("Please enter a valid city"), dismissButton: .cancel())
                    }
        }
        
    }
}

//MARK: - Previews
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
