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
                    print("finish")
                    // 로그인 성공
                    self.isLogined = true //🧩
                case .failure(let failure):
                    print("fail")
                }
            
        }, receiveValue: { result in
            switch result {
            case .success(let data):
                print("success")
            case .failure(let error):
                print(error.message)
            }
        })
        .store(in: &cancellable)
    }
    
}
