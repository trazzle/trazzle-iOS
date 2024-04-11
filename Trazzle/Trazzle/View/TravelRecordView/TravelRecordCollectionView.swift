//
//  TravelRecordCollectionView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/25.
//

import SwiftUI

struct TravelRecordCollectionView: View {
    
    // test
    let data = Array(1...10).map { "\($0)"}
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mapBgColor.ignoresSafeArea(edges: .bottom)
                VStack(spacing: 8) {
                    ProfileHeaderView()
                        .frame(height: 160)
                        .background(.white)
                    
                    // 마그넷뷰
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 7)  {
                            ForEach(data, id: \.self) { i in
                                VStack {
                                    NavigationLink(
                                        destination: RecordDetailView()) {
                                            TravelRecordCell()}
                                }
                                .background(.white)
                            }
                        }
                        .padding(.top, 8)
                    }
                    .padding([.leading, .trailing], 16)
                }
                
            }
        }
        .toolbar {
            ToolbarItem {
                NavigationLink(
                    destination: {
                        SettingView() },
                    label: {
                        Image("setting_icon")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.g900)
                        .padding(.trailing, 4)
                    })
            }
        }
        .tint(.black)
    }
}
struct MapCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        TravelRecordCollectionView()
    }
}
