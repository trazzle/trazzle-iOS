//
//  ProfileEditView.swift
//  Trazzle
//
//  Created by 연승주 on 4/14/24.
//

import SwiftUI
import Combine

struct ProfileEditView: View {
    
    @State var user: User
    @State private var profileBio: String
    
    init(user: User, _ profileBio: String = "") {
        self.user = user
        self.profileBio = user.intro ?? ""
    }
    
    @FocusState private var isFocused: Bool
    @ObservedObject private var keyboard = KeyboardResponder()
    
    let textLimit = 50 //Your limit
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            VStack(spacing: 16) {
                ZStack(alignment: .bottom) {
                    
                    HStack(spacing: 26) {
                        TZImageView(urlString: user.profileImageURL ?? "")
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.homeBgColor,
                                                     lineWidth: 1))
                            .frame(width: 68, height: 68)
                        
                        Text(user.name)
                            .foregroundColor(.g900)
                            .font(.system(size: 22, weight: .semibold))
                        Spacer()
                    }
                    
                    Button(action: {
                        print("프로필 사진 수정 클릭")
                    }, label: {
                        Image("edit")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundStyle(Color.white)
                            .frame(width: 16, height: 16)
                            .padding(.all, 6)
                            .background(Color.sy800)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,
                                                     lineWidth: 5))
                    })
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(.leading, 56)
                    
                }
                // 프로필 메세지 수정 영역
                VStack(spacing: 8) {
                    TextField("프로필 소개글을 입력해주세요",
                              text: $profileBio, axis: .vertical)
                    .foregroundColor(.black)
                    .focused($isFocused)
                    .onAppear {
                        UIApplication.shared.hideKeyboard()
                    }
                    .onReceive(Just($profileBio)) { _ in limitText(textLimit) }
                    .onSubmit {
                        print("입력 완료")
                        isFocused = false
                        UIApplication.shared.hideKeyboard()
                    }
                    .submitLabel(.done)
                    
                    
                    Text(" \(profileBio.count) / 50")
                        .foregroundStyle(Color.g200)
                        .font(.system(size: 16, weight: .medium))
                        .frame(maxWidth: .infinity,
                               alignment: .trailing)
                }
                .padding(.all, 16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.g200, lineWidth: 1)
                )
                
                // 프로필 수정 버튼
                Button(action: {
                    print("프로필 수정 버튼 클릭")
                }, label: {
                    Text("프로필 수정").foregroundStyle(Color.g500)
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.g200, lineWidth: 1)
                )
                
            }
            .padding([.leading, .trailing], 16)
            .padding(.top, 8)
            .padding(.bottom, 20)
        }
        .padding(.bottom, keyboard.currentHeight)
//        .edgesIgnoringSafeArea(.bottom)
    }
}

extension ProfileEditView {
    func limitText(_ upper: Int) {
        if profileBio.count > upper {
            profileBio = String(profileBio.prefix(upper))
        }
    }
}

#Preview {
    ProfileEditView(user: .init(access_token: "", id: 1,
                                account: "", name: "홍주연",
                                profileImageURL: "", intro: ""))
}
