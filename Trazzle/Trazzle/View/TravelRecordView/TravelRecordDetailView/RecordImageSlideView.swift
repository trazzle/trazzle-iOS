//
//  RecordImageSlideView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct CardImage: Identifiable {
    var id = UUID().uuidString
    var image: String
}

struct RecordImageSlideView: View {
    @State var currentIndex: Int = 1
    // test
    @State var data: [CardImage] = []
    
    
    var body: some View {
        ZStack {
            Color.mapBgColor.ignoresSafeArea()
            VStack {
                // 스크롤 인덱스
                let txt = String(format: "%d", currentIndex) + " / " + String(format: "%d", data.count)
                Text(txt)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.g300)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding([.top, .trailing, .bottom], 16)
                
                // 사진 이미지
                SnapCarouselView(spacing: 8, trailingSpace: 26,
                                 index: $currentIndex, items: data) { data in
                    
                    GeometryReader { proxy in
                        let size = proxy.size
                        
                        Image(data.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width)
                        
//                        RoundedRectangle(cornerRadius: 4)
//                            .fill(Color.white)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 4)
//                                    .stroke(Color.shadowColor, lineWidth: 1)
//                                    .shadow(color: .g50,
//                                            radius: 4,
//                                            x: 4, y: 4)
//                            )
//                            .overlay(
//                                Image(data.image)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: size.width)
//                                    .padding(.top, 12)
//                                    .padding([.leading, .trailing], 14)
//                                    .padding(.bottom, 76)
//                            )
                    }
                    
                }
            }
            .onAppear {
                for index in 0...5 {
                    data.append(CardImage(image: "photo\(index)"))
                }
            }
        }
        //        ZStack {
        //            Color.mapBgColor.ignoresSafeArea()
        //            VStack {
        //                // 스크롤 인덱스
        //                HStack {
        //                    Spacer()
        //                    let txt = String(format: "%d", currentIndex) + " / " + String(format: "%d", data.count)
        //                    Text(txt)
        //                        .font(.system(size: 18, weight: .regular))
        //                        .foregroundColor(.g300)
        //                        .frame(alignment: .trailing)
        //                }
        //                .padding([.top, .trailing, .bottom], 16)
        //
        //
        //                Carousel(pageCount: data.count, visibleEdgeSpace: 20, spacing: 8) { index in
        //                    // 인덱스 변경
        //                    RoundedRectangle(cornerRadius: 4)
        //                        .fill(Color.white)
        //                        .overlay(
        //                            RoundedRectangle(cornerRadius: 4)
        //                                .stroke(Color.shadowColor, lineWidth: 1)
        //                                .shadow(color: .g50,
        //                                        radius: 4,
        //                                        x: 4, y: 4)
        //
        //                        )
        //                        .overlay(
        //                            Image(data[index])
        //                                .resizable()
        //                                .aspectRatio(contentMode: .fit)
        //                                .background(.pink)
        //                                .padding(.top, 12)
        //                                .padding([.leading, .trailing], 14)
        //                                .padding(.bottom, 76)
        //                        )
        //                }
        //                .frame(height: 383)
        //            }
        //        }
    }
}

struct RecordImageCell_Previews: PreviewProvider {
    static var previews: some View {
        RecordImageSlideView()
    }
}
