//
//  AppleButton.swift
//  Trazzle
//
//  Created by joomin on 3/27/24.
//

import AuthenticationServices
import SwiftUI

struct AppleButton: View {
    let authorize = Authorize()
    let vm: LoginViewModel
    
    init(vm: LoginViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Button(action: {
            authorize.authButtonTapped()
            
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 52)
                
                HStack {
                    Image("apple_icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    
                    Text("Apple로 계속하기")
                        .foregroundColor(.white)
                }
            }
        }
        .padding(8)
        .onAppear {
                    // Authorize 클래스에 completionHandler 설정
                    authorize.completionHandler = { tokenString in
                        // completionHandler를 통해 전달받은 데이터 처리
                        if let token = tokenString {
                            print(token)
                            vm.doAppleLogin(accessToken: token)
                        } else {
                            print("애플 token nil")
                        }
                    }
                }
    }
}

