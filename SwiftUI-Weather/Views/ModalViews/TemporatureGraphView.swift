//
//  TemporatureGraphView.swift
//  SwiftUI-Weather
//
//  Created by 신지혜 on 7/31/24.
//

import SwiftUI

struct TemporatureGraphView: View {
    @State var selectedMode = "실제 온도"
    let mode = ["실제 온도", "체감 온도"]
    var body: some View {
        VStack(alignment: .leading) {
            Text("최고:32° 최저:26°")
                .foregroundStyle(.white)
                .font(.footnote)
            ZStack {
                Rectangle()
                    .frame(width: 370, height: 300)
                    .cornerRadius(15)
                    .foregroundColor(.gray)
                Text("\(selectedMode) 그래프")
            }
            Picker("카테고리", selection: $selectedMode) {
                ForEach(mode, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.palette)
            .frame(width: 350)
        }
    }
}

#Preview {
    TemporatureGraphView()
}
