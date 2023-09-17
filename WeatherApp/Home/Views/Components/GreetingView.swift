//
//  GreetingView.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary on 16/09/23.
//

import SwiftUI

struct GreetingView: View {
 
    //MARK: - View Builder
    var body: some View {
        VStack{
            Text(AppConstants.greetingMsg)
                .foregroundColor(Color.white)
                .font(.title)
                .bold()
        }
    }
}
  
//MARK: - Previews
struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView()
    }
}
