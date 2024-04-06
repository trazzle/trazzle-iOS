//
//  RecordDetailView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct RecordDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 52)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        // 사진 이미지 페이지
                        VStack {
                            RecordImageSlideView()
                                .frame(height: getBgSize().height)
                            Spacer().frame(height: 48)
                        }
                        .padding(.leading, 20)
                        .background(Color.mapBgColor)
                        
                        // 여행기 제목 헤더
                        RecordTitleView()
                        // 텍스트 뷰 (일단은...)
                        ZStack {
                            Text("가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바")
                                .frame(maxWidth: .infinity)
                                .padding([.leading, .trailing], 16)
                        }
                        .background(.white)
                    }
                }
            }.background(VStack{ Color.mapBgColor ; Color.white })
        }
        .navigationTitle("내 여행").foregroundColor(.g900)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    print("edit button click")
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("backArrow")
                })
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("edit button click")
                }, label: {
                    Image("edit")
                })
            }
        }
        .safeAreaInset(edge: .top) {
            TravelDetailAccessoryView(name: "김철수", image: "book")
                .frame(height: 52)
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

struct RecordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecordDetailView()
    }
}
