//
//  LoginProviderType.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Foundation

enum LoginProviderType: String {
    case kakao
    case google
    case apple
    
    func typeName() -> String {
        switch self {
        case .kakao: return "k"
        case .google: return "g"
        case .apple: return "a"
        }
    }
}
