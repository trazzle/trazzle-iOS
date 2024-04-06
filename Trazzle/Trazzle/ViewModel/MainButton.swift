//
//  mainButton.swift
//  Trazzle
//
//  Created by joomin on 3/29/24.
//

import SwiftUI

struct MainButton: View {
    var buttonText: String
    
    var body: some View {
        Button(action: {
            // 버튼이 클릭되었을 때 수행할 작업
        }) {
            Text(buttonText)
                .foregroundColor(.g500) // 텍스트 색상을 흰색으로 설정
                .padding() // 내부 여백 추가
                .background(Color.g200) // 배경 색상을 파란색으로 설정
                .cornerRadius(16)
                .frame(maxWidth: .infinity)
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    MainButton(buttonText: "테스트")
}
