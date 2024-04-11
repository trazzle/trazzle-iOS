//
//  RecordTitleView.swift
//  Trazzle
//
//  Created by hongzuyeon on 3/30/24.
//

import SwiftUI

struct RecordTitleHeaderView: View {
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 12) {
                Spacer().frame(height: 38)
                Text("아프가니스탄 여행기")
                    .foregroundStyle(Color.g900)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity)
                
                Text("23.00.00 ~ 23.00.00")
                    .foregroundStyle(Color.g500)
                    .font(.system(size: 14, weight: .light))
                    .padding(.bottom, 18)
            }
            .overlay {
                Image("magnet")
                    .scaledToFill()
                    .clipped()
                    .frame(width: 84, height: 84)
                    .position(x: (UIScreen.main.bounds.width) / 2, y: 0)
            }
        }
    }
}

#Preview {
    RecordTitleHeaderView()
}
