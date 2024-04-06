//
//  HomeNavView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/27.
//

import SwiftUI

struct HomeNavView: View {
    
    @Binding var titleText: String
    @State var isShowingCountryStatisticsView = false
    
    var body: some View {
        ZStack {
            Color.white.opacity(0.6).ignoresSafeArea()
            VStack(spacing: 0) {
                HStack(alignment: .center) {
                    Text(titleText)
                        .padding(.horizontal, 16)
                        .foregroundColor(.p900)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .frame(alignment: .center)
                    Spacer()
                    Group {
                        Button(action: {
                            print("export button action")
                        },label: {
                            Image("share")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        })
                        
                        Button(action: {
                            self.isShowingCountryStatisticsView.toggle()
                            print("isShowingCS: \(isShowingCountryStatisticsView)")
                            
                        },label: {
                            Image("chart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        })
                    }
                    .frame(width: 48, height: 48)
                    Spacer().frame(width: 4)
                }
//                CountryStatisticView(isRecordView: false)
//                    .frame(height: 109)
//                    .hide(if: !isShowingCountryStatisticsView)
            }
        }
    }
}

struct HomeNavView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavView(titleText: .constant("Trazzle에서 내 여행을 기록해요!"))
    }
}
