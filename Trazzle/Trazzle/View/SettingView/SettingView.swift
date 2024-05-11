//
//  SettingView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/30.
//

import SwiftUI

struct SettingView: View {
    
    @Binding var user: User
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var vm = SettingViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea(.all)
                ScrollView(.vertical) {
                    VStack {
                        ProfileEditView(user: user)
                            .padding(.bottom, 18)
                        
                        Color.g50.frame(height: 8)
                        
                        ForEach(vm.menuData, id: \.self) { menu in
                            Button(action: {
                                switch menu {
                                case .이용약관:
                                    print("이용약관")
                                case .개인정보처리방침:
                                    print("개인정보처리방침")
                                case .고객센터:
                                    print("고객센터")
                                case .로그아웃:
                                    print("로그아웃")
                                case .회원탈퇴:
                                    print("회원탈퇴")
                                }
                            }, label: {
                                Text(menu.getString())
                                    .font(.system(size: 15, weight: .medium))
                                    .foregroundStyle(Color.black)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            })
                            .padding([.leading, .trailing], 16)
                            .frame(height: 52)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }

            }
        }
        // 네비게이션바 세팅
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("설정").foregroundStyle(Color.g900)
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
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(user: .constant(.init(access_token: "", id: 1,
                                          account: "", name: "홍주연",
                                          profileImageURL: "", intro: "")))
    }
}
