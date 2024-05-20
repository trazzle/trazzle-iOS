//
//  LoginView.swift
//  Trazzle
//
//  Created by joomin on 3/26/24.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn
import Combine

struct LoginView: View {
    
    @Binding var isFullScreenOver: Bool
    @ObservedObject var vm = LoginViewModel()
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color(.white)
                .ignoresSafeArea(.all)
            
            HStack {
                Spacer()
                Button(action: {
                    isFullScreenOver.toggle()
                    
                }, label: {
                    Image("close_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                })
                .frame(width: 48, height: 48)
                .padding(.trailing, 4)
            }.background(Color.white)
            
            Image("login_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .edgesIgnoringSafeArea(.all)
                .padding(.top, 48)
            
            VStack {
                Spacer()
                KakaoButton(vm: vm)
                GoogleButton(vm: vm)
                AppleButton(vm: vm)
                
                Text("로그인 및 회원가입시, 아래 내용에 동의하는 것으로 간주됩니다.")
                    .foregroundColor(.g400)
                    .font(Font.system(size: 12))
                    .padding(.vertical, 12)
                
                HStack {
                    Text("약관 동의")
                        .foregroundColor(.g400)
                        .underline(true, color: .g400)
                    
                    Text("개인정보처리방침")
                        .foregroundColor(.g400)
                        .underline(true, color: .g400)
                }
            }
            
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isFullScreenOver: .constant(false))
    }
}

