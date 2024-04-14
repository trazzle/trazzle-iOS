//
//  TravelRecordViewModel.swift
//  Trazzle
//
//  Created by 홍주연 on 4/14/24.
//

import SwiftUI

class TravelRecordViewModel: ObservableObject {
    
    private var loginManager: LoginManager
    
    @Published var user: User
    
    init() {
        print("TRV init")
        self.loginManager = LoginManager.shared
        self.user = loginManager.user ?? User(access_token: "", id: 0, account: "",
                                              name: "", profileImageURL: nil, intro: nil)
        print("TRV self.user: \(user)")
    }
}
