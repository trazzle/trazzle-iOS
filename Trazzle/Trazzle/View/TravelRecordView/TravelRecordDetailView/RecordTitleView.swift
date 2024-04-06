//
//  RecordTitleView.swift
//  Trazzle
//
//  Created by 연승주 on 3/30/24.
//

import SwiftUI

struct RecordTitleView: View {
    
    var body: some View {
        let cities: [String] = ["가나", "다라", "가나다라", "마바사아자차카","가나마바", "홀리호리리", "트레즐"]
        
        VStack {
            VStack(spacing: 12) {
                Spacer().frame(height: 38)
                Group {
                    Text("아프가니스탄 여행기")
                        .foregroundStyle(Color.g900)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Text("23.00.00 ~ 23.00.00")
                        .foregroundStyle(Color.g500)
                        .font(.system(size: 14, weight: .light))
                }
                Spacer().frame(height: 18)
                    .frame(maxWidth: .infinity)
            }
            .overlay {
                Image("magnet")
                    .scaledToFill()
                    .clipped()
                    .frame(width: 84, height: 84)
                    .position(x: (UIScreen.main.bounds.width) / 2, y: 0)
            }
            Spacer().frame(height: 8)
            // 다녀온 나라
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
        }.background(.white)
    }
}

#Preview {
    RecordTitleView()
}
