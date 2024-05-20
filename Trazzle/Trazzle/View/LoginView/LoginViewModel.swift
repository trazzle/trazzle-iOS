//
//  LoginViewModel.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var isLogined = false //🧩
    private var cancellable = Set<AnyCancellable>()

    // 카카오 로그인
    func doKakaoLogin(accessToken: String) {
        NetworkService.shared.kakaoLogin(accessToken: accessToken)
            .sink(receiveCompletion: { error in
                TZLoadingView.shared.hide()
                print(error)
            }, receiveValue: { data in
                TZLoadingView.shared.hide()
                // 🧩 로그인 성공
                self.isLogined = true
                
                LoginManager.shared.user = data
                print("login success: \(data)")
            })
            .store(in: &cancellable)
    }
    
    // 구글 로그인
    func doGoogleLogin(accessToken: String) {
        NetworkService.shared.googleLogin(accessToken: accessToken)
            .sink(receiveCompletion: { error in
                TZLoadingView.shared.hide()
                print(error)
            }, receiveValue: { data in
                TZLoadingView.shared.hide()
                // 🧩 로그인 성공
                self.isLogined = true
                
                LoginManager.shared.user = data
                print("login success: \(data)")
            })
            .store(in: &cancellable)
    }
    
    // 애플 로그인
    func doAppleLogin(accessToken: String) {
        NetworkService.shared.appleLogin(accessToken: accessToken)
            .sink(receiveCompletion: { error in
                TZLoadingView.shared.hide()
                print(error)
            }, receiveValue: { data in
                TZLoadingView.shared.hide()
                // 🧩 로그인 성공
                self.isLogined = true
                
                LoginManager.shared.user = data
                print("login success: \(data)")
            })
            .store(in: &cancellable)
    }

    // 테스트 로그인
    func dotestLogin(account: String) {
        NetworkService.shared.testLogin(account: account)
            .sink(receiveCompletion: { error in
                TZLoadingView.shared.hide()
                print(error)
            }, receiveValue: { data in
                TZLoadingView.shared.hide()
                // 🧩 로그인 성공
                self.isLogined = true
                
                LoginManager.shared.user = data
                print("login success: \(data)")
            })
        .store(in: &cancellable)
    }
    
}
