//
//  CustomSearchBar.swift
//  WeatherApp
//
//  Created by Abhishek Choudhary on 16/09/23.
//

import SwiftUI

struct CustomSearchBar: View {
    
    //MARK: - Properties
    @Binding var searchText : String
    
    //MARK: - View Builder
    var body: some View {
        HStack{
            
            Image(systemName: "magnifyingglass")
                .font(.title)
                .padding(.leading,24)
            
            TextField("", text: $searchText,
                      prompt: Text("Search For City")
                .foregroundColor(.white.opacity(0.5))
            )
            .font(.title3)
            .padding(.horizontal, 8)
            .accentColor(.white)
            .autocorrectionDisabled(true)
            Spacer()
        }
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.blue)
                .frame(width: AppConstants.screenWidth - 32, height: AppConstants.screenHeight/14)
        )
      
    }
}

//MARK: - Previews
struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(searchText: .constant("Search For City"))
    }
}
