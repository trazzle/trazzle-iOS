//
//  RecordDetailView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct RecordDetailView: View {
    
//    @State var images = ["google_icon", "globe", "book", "apple_icon", "kakao_icon", "share"]
//    @State var currentIndex: Int = 0
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea()
                ScrollView(.vertical) {
                    VStack(spacing: 0) {
                        // 유저 뷰
                        RecordUserInfoView(name: "김철수", image: "book")
                            .frame(height: 52)
                        
                        // 이미지 뷰
//                        InfiniteCarouselView(images: $images, currentIndex: $currentIndex)
                        RecordImageSlideView()
                            .frame(height: 424)
                        
                        Color.mapBgColor
                            .frame(height: 52)
                        
                        // 여행기 제목 헤더
                        RecordTitleHeaderView()
                        
                        Color.mapBgColor
                            .frame(height: 8)
                        
                        // 여행 키워드 뷰
                        RecordKeywordView()
                        
                        
                        
                        // 텍스트 뷰 (일단은...)
                        Text("가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바")
                            .frame(maxWidth: .infinity)
                            .padding([.leading, .trailing], 16)
                            .padding(.bottom, 40)
                            .background(.white)
                            .foregroundStyle(Color.black)
                    }
                }
                .scrollIndicators(.hidden)
            }
            
        }
        // 네비게이션바 세팅
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("내 여행").foregroundStyle(Color.g900)
        .toolbar(.visible, for: .navigationBar)
        .toolbarBackground(.white, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    print("edit button click")
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("backArrow")
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("edit button click")
                }, label: {
                    Image("edit")
                        .resizable()
                        .frame(width: 24, height: 24)
                })
            }
        }
    }
}

extension RecordDetailView {
    func getBgSize() -> CGSize {
        let width = UIScreen.main.bounds.width - 14 - 14
        let height = getImageSize().height + 12 + 76
        return CGSize(width: width, height: height)
    }
    
    func getImageSize() -> CGSize {
        let width = UIScreen.main.bounds.width - 34 - 46
        return CGSize(width: width, height: width)
    }
}

#Preview {
    RecordDetailView()
}
