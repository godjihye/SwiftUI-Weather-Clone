//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by jhshin on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    var body: some View {
      
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    Text("나의 위치")
                        .foregroundStyle(.white)
                        .padding(.top, 30)
                    Text("인천광역시")
                        .font(.system(size: 32, weight: .medium, design: .default))
                        .foregroundStyle(.white)
                    Text("31°") // option + shift + 8
                        .font(.system(size:100, weight: .thin))
                        .foregroundStyle(.white)
                    Text("부분적으로 흐림")
                        .foregroundStyle(.white)
                    Text("최고:31° 최저:25°")
                        .foregroundStyle(.white)
                }
                .padding(.bottom,30)
                ZStack {
                    Button(action: {
                        self.showModal = true
                    }){
                        Rectangle()
                            .cornerRadius(20)
                            .opacity(0.25)
                            .frame(width: 380, height: 160)
                    }
                    .sheet(isPresented: self.$showModal) {
                        ModalView()
                    }
                    VStack {
                        Text("오후 9시쯤 흐린 상태가 예상됩니다. 돌풍의 풍속은 최대 \n8m/s입니다.")
                            .font(.system(size: 15))
                            .foregroundStyle(.white)
                            .padding(.leading, 8)
                            
                        Divider()
                            .frame(width: 350)
                            .background(.white)
                        HStack {
                            WeatherForecast(time: "지금", image: "cloud.sun.fill", temp: 32)
                            WeatherForecast(time: "오후 1시", image: "cloud.drizzle.fill", temp: 32)
                            WeatherForecast(time: "오후 2시", image: "cloud.drizzle.fill", temp: 32)
                            WeatherForecast(time: "오후 3시", image: "cloud.heavyrain.fill", temp: 31)
                            WeatherForecast(time: "오후 4시", image: "cloud.fill", temp: 31)
                            
                        }
                    }
                }
                .padding(.top, 20)
                
                
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .opacity(0.25)
                        .frame(width: 380, height: 270)
                    VStack(spacing: 10) {
                        HStack(spacing: 3) {
                            Image(systemName: "calendar")
                            Text("5일간의 일기예보")
                            Spacer()
                        }
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .opacity(0.7)
                        .padding(.leading, 20)
                        
                        Divider()
                            .frame(width: 350)
                            .background(.white)
                        
                        WeatherForecastRow(date: "오늘", imageName: "sun.max.fill", minTemp: 25, maxTemp: 32)
                        WeatherForecastRow(date: "목", imageName: "cloud.sun.fill", minTemp: 25, maxTemp: 32)
                        WeatherForecastRow(date: "금", imageName: "cloud.bolt.rain.fill", minTemp: 25, maxTemp: 32)
                        WeatherForecastRow(date: "토", imageName: "sun.max.fill", minTemp: 25, maxTemp: 32)
                        WeatherForecastRow(date: "일", imageName: "cloud.sun.fill", minTemp: 25, maxTemp: 32)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

// cmd+shift+L
