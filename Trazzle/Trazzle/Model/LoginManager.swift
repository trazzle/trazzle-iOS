//
//  LoginManager.swift
//  Trazzle
//
//  Created by joomin on 3/30/24.
//

import Foundation

class LoginManager {
    static let shared = LoginManager()
    var user: User?
    
    private init() {}
    
    // 로그인 상태 관리 변수
    var isLoggedIn: Bool {
        return user != nil
    }
    
    // 로그인 기능
    func login(loginUser: User) {
        self.user = loginUser
    }
    
    // 로그아웃 기능
    func logout() {
        // 로그아웃 프로세스 구현
        user = nil
    }
}
