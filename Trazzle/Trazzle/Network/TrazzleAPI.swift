//
//  TrazzleAPI.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Moya
import Foundation

enum TrazzleAPI {
    // MARK: Login
    case testLogin(account: String)
    case kakaoLogin(accessToken: String)
}

extension TrazzleAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://trazzle.p-e.kr/api/")!
    }
    
    var path: String {
        switch self {
        // MARK: Login
        case .testLogin: return "users/sign-in/account"
        case .kakaoLogin: return "users/sign-in/kakao"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .post
        }
    }
    
    var task: Moya.Task {
        var params: [String:Any] = [:]
        switch self {
        case .testLogin(let account):
            params["account"] = account
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        case let .kakaoLogin(accessToken):
            params["accessToken"] = accessToken
            params["oauthProvider"] = LoginProviderType.kakao.typeName()
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Accpet" : "application/json; charset=utf-8"]
    }
}
