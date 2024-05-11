//
//  SettingViewModel.swift
//  Trazzle
//
//  Created by 홍주연 on 4/14/24.
//

import Foundation

class SettingViewModel {
    
    enum MenuData: String, CaseIterable {
        case 이용약관
        case 개인정보처리방침
        case 고객센터
        case 로그아웃
        case 회원탈퇴
        
        func getString() -> String {
            switch self {
            case .이용약관:
                return "이용 약관"
            case .개인정보처리방침:
                return "개인정보 처리방침"
            default:
                return rawValue.description
                
            }
        }
    }
    
    var menuData: [MenuData]
    
    init() {
        menuData = MenuData.allCases.map { $0 }
    }

}

