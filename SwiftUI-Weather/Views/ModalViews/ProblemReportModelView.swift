//
//  ProblemReportModelView.swift
//  SwiftUI-Weather
//
//  Created by 신지혜 on 8/1/24.
//

import SwiftUI

struct ProblemReportModelView: View {
    @Environment(\.presentationMode) var presentation
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack{
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("취소")
                            .font(.system(size: 20))
                    }
                    .frame(alignment: .trailing)
                    .buttonStyle(.plain)
                    Spacer()
                    Text("문제 리포트")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }) {
                        Text("제출")
                            .font(.system(size: 20))
                    }
                    .frame(alignment: .trailing)
                    .buttonStyle(.plain)
                }
                .padding(.vertical, 30)
                Text("현재 위치의 현재 기상 상태를 설명하여 날씨 앱을 향상하는 데 도움을 줍니다.")
                Text("Apple은 사용자의 피드백 및 위치를 수집하지만, 이 정보는 사용자의 Apple 계정과 연계되지 않습니다.")
                    .font(.footnote)
                
                Spacer()
                
            }
            // .navigationTitle("문제 리포트")
        }
    }
}

#Preview {
    ProblemReportModelView()
}
