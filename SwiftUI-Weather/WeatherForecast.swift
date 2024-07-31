//
//  WeatherForecast.swift
//  SwiftUI-Weather
//
//  Created by jhshin on 7/30/24.
//

import SwiftUI

struct WeatherForecast: View {
    let time: String
    let image: String
    let temp: Int
    
    var body: some View {
        VStack {
            Text("\(time)")
                .foregroundStyle(.white)
                .font(.system(size: 14))
                .fontWeight(.bold)
            Image(systemName: "\(image)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 20)
            Text("\(temp)°")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 60)
    }
}

#Preview {
    WeatherForecast(time: "지금", image: "cloud.sun.fill", temp: 29)
}
