//
//  RecordUserInfoView.swift
//  Trazzle
//
//  Created by 홍주연 on 3/30/24.
//

import SwiftUI

struct RecordUserInfoView: View {
    
    var name: String
    var image: String
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            HStack(alignment: .center) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.homeBgColor, lineWidth: 1))
                    .frame(width: 32, height: 32)
                    .padding(.trailing, 8)
                Text(name)
                    .foregroundColor(.g900)
                    .font(.system(size: 18, weight: .semibold))
                Spacer()
            }
            .padding(.leading, 16)
            .padding([.top, .bottom], 10)
        }
    }
}
