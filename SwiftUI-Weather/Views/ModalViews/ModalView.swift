//
//  ModalView.swift
//  SwiftUI-Weather
//
//  Created by 신지혜 on 7/31/24.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    var category: [String : String] = ["기상 상태" : "cloud.sun.fill", "자외선 지수" : "sun.max.fill", "바람" : "wind", "강수량" : "drop", "습도" : "humidity"]
    @State private var selectedCategory = "기상 상태"
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                HStack(alignment: .center){
                    Image(systemName: "cloud.sun.fill")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("기상 상태")
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                }
                .padding(.leading, 110)
                .padding(.trailing, 70)
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .font(.system(size: 30))
                }
                .frame(alignment: .trailing)
            }
            HStack(spacing: 40) {
                DateView(day: "화", date: 30)
                DateView(day: "수", date: 31)
                DateView(day: "목", date: 1)
                DateView(day: "금", date: 2)
                DateView(day: "토", date: 3)
                DateView(day: "일", date: 4)
                DateView(day: "월", date: 5)
            }
            Text("2024년 7월 31일 수요일")
                .foregroundStyle(.white)
            Divider()
                .background(.white)
            
            VStack {
                HStack {
                    Text("32°")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 120)
                    Picker("카테고리", selection: $selectedCategory) {
                        ForEach(category.keys.sorted(), id: \.self) { key in
                            HStack {
                                Text(key)
                                Image(systemName: category[key]!)
                            }
                            .tag(key)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(width: 150)
                }
                if selectedCategory == "기상 상태" {
                    TemporatureGraphView()
                }
            }
            Divider()
                .background(.white)
            HStack {
                Text("강수 확률")
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                    .padding(.leading, 10)
                    .fontWeight(.bold)
                Spacer()
            }
            Text("오늘 강수 확률: 0%")
                .foregroundStyle(.white)
            Spacer()
            
        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.modal)
    }
}

#Preview {
    ModalView()
}

struct DateView: View {
    let day: String
    let date: Int
    var body: some View {
        VStack(spacing: 10) {
            Text("\(day)")
                .foregroundStyle(.white)
                .fontWeight(.bold)
            Text("\(date)")
                .foregroundStyle(.white)
        }
    }
}
