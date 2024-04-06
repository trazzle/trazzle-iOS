//
//  LoginView.swift
//  Trazzle
//
//  Created by joomin on 3/26/24.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            Color(.white)
                .ignoresSafeArea(.all)
            
            Image("login_bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                KakaoButton()
                GoogleButton()
                AppleButton()
                
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
        LoginView()
    }
}

