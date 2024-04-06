//
//  RecordImageSlideView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct RecordImageSlideView: View {
    @State var currentIndex: Int = 1
    
    var body: some View {
        // test
        let data = ["google_icon", "globe", "book", "apple_icon", "kakao_icon", "share"]
        
        ZStack {
            Color.mapBgColor.ignoresSafeArea()
            VStack {
                // 스크롤 인덱스
                HStack {
                    Spacer()
                    let txt = String(format: "%d", currentIndex) + " / " + String(format: "%d", data.count)
                    Text(txt)
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.g300)
                        .frame(alignment: .trailing)
                }
                .padding([.top, .trailing, .bottom], 16)
                
                // 사진 이미지
                Carousel(pageCount: data.count, visibleEdgeSpace: 20, spacing: 8) { index in
                    // 인덱스 변경
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.shadowColor, lineWidth: 1)
                                .shadow(color: .g50,
                                        radius: 4,
                                        x: 4, y: 4)
                            
                        )
                        .overlay(
                            Image(data[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .background(.pink)
                                .padding(.top, 12)
                                .padding([.leading, .trailing], 14)
                                .padding(.bottom, 76)
                        )
                }
                .frame(height: 383)
            }
        }
    }
}


extension RecordImageSlideView {
    func setIndex(current index: Int) -> some View {
        currentIndex = index
        return Text("").hidden().frame(width: 0, height: 0)
    }
}

struct RecordImageCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordImageSlideView()
    }
}
