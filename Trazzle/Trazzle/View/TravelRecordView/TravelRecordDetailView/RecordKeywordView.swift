//
//  RecordKeywordView.swift
//  Trazzle
//
//  Created by 연승주 on 4/7/24.
//

import SwiftUI

struct RecordKeywordView: View {
    var body: some View {
        let cities: [String] = ["아시아", "대한민국", "서울", "South Korea","Seoul"]
        
        // 다녀온 나라
        ZStack {
            Color.white.ignoresSafeArea()
            WrappedHStack(cities) { city in
                Text(city)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.p900)
                    .frame(width: city.widthOfString(usingFont: .systemFont(ofSize: 14)))
                    .padding([.leading, .trailing], 12)
                    .padding([.top, .bottom], 9)
                    .overlay(
                        RoundedRectangle(cornerRadius: 44)
                            .stroke(Color.p500, lineWidth: 1)
                    )
            }
            .padding([.leading, .trailing], 16)
            .padding([.top, .bottom], 22)
        }
    }
}

#Preview {
    RecordKeywordView()
}
