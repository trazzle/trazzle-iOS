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
                switch error {
                case .finished:
                    // 로그인 성공
                    self.isLogined = true //🧩
                    print("finish")
                case .failure(let failure):
                    print("fail \(failure.localizedDescription)")
                }
            
        }, receiveValue: { result in
            switch result {
            case .success(let data):
                LoginManager.shared.user = data
                print("login success: \(data)")
            case .failure(let error):
                print(error.message)
            }
        })
        .store(in: &cancellable)
    }
    
    // 테스트로그인
    func dotestLogin(account: String) {
        NetworkService.shared.testLogin(account: account)
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    // 로그인 성공
                    self.isLogined = true //🧩
                    print("finish")
                case .failure(let failure):
                    print("fail")
                }
            
        }, receiveValue: { result in
            switch result {
            case .success(let data):
                LoginManager.shared.user = data
                print("login success: \(data)")
            case .failure(let error):
                print(error.message)
            }
        })
        .store(in: &cancellable)
    }
    
}
