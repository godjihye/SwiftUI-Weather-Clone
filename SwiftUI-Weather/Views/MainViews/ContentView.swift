//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by jhshin on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @State private var showProblemReportModal = false
    var body: some View {
      
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 5) {
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
                            .offset(x: 15)
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
                            RoundedRectangle(cornerRadius: 20)
                                .opacity(0.1)
                                .frame(width: 380, height: 160)
                                .foregroundStyle(.black)
                                
                        }
                        .sheet(isPresented: self.$showModal) {
                            ModalView(day: 1)
                        }
                        .buttonStyle(.plain)
                        
                        VStack {
                            Text("오후 9시쯤 흐린 상태가 예상됩니다. 돌풍의 풍속은 최대 \n8m/s입니다.")
                                .font(.system(size: 15))
                                .foregroundStyle(.white)
                            
                            Divider()
                                .frame(width: 350)
                                .background(.white)
                            ScrollView(.horizontal){
                                HStack {
                                    WeatherForecast(time: "지금", image: "cloud.sun.fill", temp: 32)
                                    WeatherForecast(time: "오후 1시", image: "cloud.drizzle.fill", temp: 32)
                                    WeatherForecast(time: "오후 2시", image: "cloud.drizzle.fill", temp: 32)
                                    WeatherForecast(time: "오후 3시", image: "cloud.heavyrain.fill", temp: 31)
                                    WeatherForecast(time: "오후 4시", image: "cloud.fill", temp: 31)
                                    WeatherForecast(time: "오후 5시", image: "cloud.fill", temp: 31)
                                    WeatherForecast(time: "오후 6시", image: "cloud.fill", temp: 31)
                                    WeatherForecast(time: "오후 7시", image: "cloud.fill", temp: 31)
                                    
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.top, 20)
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.1)
                            .frame(width: 380, height: 270)
                            .foregroundStyle(.black)
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
                            WeatherForecastRow(date: "목", imageName: "cloud.sun.fill", minTemp: 27, maxTemp: 32)
                            WeatherForecastRow(date: "금", imageName: "cloud.bolt.rain.fill", minTemp: 23, maxTemp: 32)
                            WeatherForecastRow(date: "토", imageName: "sun.max.fill", minTemp: 27, maxTemp: 34)
                            WeatherForecastRow(date: "일", imageName: "cloud.sun.fill", minTemp: 25, maxTemp: 32)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.1)
                            .frame(width: 380, height: 180)
                            .foregroundStyle(.black)
                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Image(systemName: "aqi.low")
                                Text("대기질")
                            }
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .opacity(0.7)
                            .padding(.bottom, 3)
                            Text("26")
                                .foregroundStyle(.white)
                                .font(.largeTitle)
                                
                            Text("좋음")
                                .foregroundStyle(.white)
                                .font(.title2)
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green,Color.yellow,Color.orange,Color.red,Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .frame(width: 330, height: 5)
                                    .cornerRadius(30)
                                Circle()
                                    .frame(width: 5, height: 5)
                                    .foregroundStyle(.white)
                                    .offset(x: -140)
                            }
                            Text("현재의 대기질 지수는 26 수준으로, 어제 이 시간과 비슷합니다.")
                                .font(.footnote)
                                .foregroundStyle(.white)
                        }
                        
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.1)
                            .frame(width: 380, height: 410)
                            .foregroundStyle(.black)
                        VStack(alignment: .leading) {
                            HStack(spacing: 3) {
                                Image(systemName: "wind")
                                Text("바람 지도")
                            }
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .opacity(0.7)
                            .padding(.bottom, 3)
                            Image("windMap")
                                .resizable()
                                .frame(width: 350, height: 350)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .opacity(0.1)
                                .frame(width: 185, height: 185)
                                .foregroundStyle(.black)
                            VStack(alignment: .leading) {
                                HStack(spacing:3) {
                                    Image(systemName: "chart.line.uptrend.xyaxis")
                                    Text("평균")
                                }
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .opacity(0.7)
                                .padding(.bottom, 3)
                                Text("+4°")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                Text("일일 평균 최고 기온과의 차이")
                                    .font(.footnote)
                                    .foregroundStyle(.white)
                                Spacer()
                                HStack {
                                    Text("오늘")
                                        .opacity(0.5)
                                    Spacer()
                                    Text("최고: 32°")
                                }
                                .foregroundStyle(.white)
                                HStack {
                                    Text("평균")
                                        .opacity(0.5)
                                    Spacer()
                                    Text("최고: 28°")
                                }
                                .foregroundStyle(.white)
                            }
                            .frame(width: 160, height: 160)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .opacity(0.1)
                                .frame(width: 185, height: 185)
                                .foregroundStyle(.black)
                            VStack(alignment: .leading) {
                                HStack(spacing: 3) {
                                    Image(systemName: "thermometer.medium")
                                    Text("체감 온도")
                                    Spacer()
                                }
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .opacity(0.7)
                                .padding(.bottom, 3)
                                
                                Text("30°")
                                    .font(.title)
                                    .foregroundStyle(.white)
                                Spacer()
                                Text("실제 온도보다 더 높게 느껴지겠습니다.")
                                    .font(.footnote)
                                    .foregroundStyle(.white)

                            }
                            .frame(width: 160, height: 160)
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.1)
                            .frame(width: 380, height: 180)
                            .foregroundStyle(.black)
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "wind")
                                Text("바람")
                            }
                            .font(.footnote)
                            .foregroundStyle(.white)
                            HStack {
                                VStack(spacing: 10) {
                                    HStack {
                                        Text("바람")
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("4m/s")
                                            .opacity(0.5)
                                    }
                                    .foregroundStyle(.white)
                                    Divider()
                                        .background(.white)
                                        .frame(width: 200)
                                    HStack {
                                        Text("돌풍")
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("8m/s")
                                            .opacity(0.5)
                                    }
                                    .foregroundStyle(.white)
                                    Divider()
                                        .background(.white)
                                        .frame(width: 200)
                                    HStack {
                                        Text("방향")
                                            .fontWeight(.bold)
                                        Spacer()
                                        Text("남남서풍 206°")
                                            .opacity(0.5)
                                    }
                                    .foregroundStyle(.white)
                                }
                                Image("wind")
                            }
                        }
                        .frame(width: 350, height: 150)
                    }
                    ZStack {
                        Button(action: {
                            self.showProblemReportModal = true
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .opacity(0.1)
                                .frame(width: 380, height: 100)
                                .foregroundStyle(.black)
                        }
                        .sheet(isPresented: self.$showProblemReportModal) {
                            ProblemReportModelView()
                        }
                        .buttonStyle(.plain)
                        HStack(spacing: 20) {
                            Image(systemName: "exclamationmark.bubble.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .opacity(0.5)
                            VStack(alignment: .leading) {
                                Text("문제 리포트")
                                    .fontWeight(.bold)
                                Text("현재 위치의 기상 상태를 설명하여 일기예보를 더욱 향상 시킬 수 있습니다.")
                                    .font(.footnote)
                                    .opacity(0.5)
                            }
                        }
                        .foregroundStyle(.white)
                        .frame(width: 360, height: 100)
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
