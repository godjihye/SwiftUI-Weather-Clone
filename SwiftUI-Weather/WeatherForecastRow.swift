//
//  WeatherForecastRow.swift
//  SwiftUI-Weather
//
//  Created by jhshin on 7/31/24.
//

import SwiftUI

struct WeatherForecastRow: View {
    let date: String
    let imageName: String
    let minTemp: Int
    let maxTemp: Int
    
    var body: some View {
    
        HStack(spacing: 40) {
            Text("\(date)")
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .frame(width: 30, alignment: .leading)
                
                
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            HStack {
                Text("\(minTemp)°")
                    .foregroundStyle(.white)
                    .opacity(0.6)
                    .fontWeight(.bold)
                ZStack {
                    Rectangle()
                        .cornerRadius(10)
                        .frame(width: 130, height: 5)
                        .opacity(0.3)
                    Rectangle()
                        .cornerRadius(10)
                        .frame(width: 90, height: 5)
                        .foregroundColor(Color.bar)
                    ZStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .offset(x: 10)
                            .opacity(0.2)
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 5,height: 5)
                            .offset(x: 10)
                    }
                }
                Text("\(maxTemp)°")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 350)
        
        Divider()
            .frame(width: 350)
            .background(.white)
        
    }
}

#Preview {
    WeatherForecastRow(date: "오늘", imageName: "sum.max.fill", minTemp: 26, maxTemp: 32)
}
