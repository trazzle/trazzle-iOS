//
//  TrazzleApp.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import GoogleSignIn

@main
struct TrazzleApp: App {
    
    init() {
            // kakao SDK 초기화
            KakaoSDK.initSDK(appKey: "a9cf757f00972eaeff4befd171abe6b1")
        }
    
    var body: some Scene {
        WindowGroup {
            HomeView(titleText: .constant(TrazzleConstants.launchTitleText)).onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    //Kakao
                    AuthController.handleOpenUrl(url: url)
                }else if ((url.scheme?.contains("com.googleusercontent.apps")) != nil) { 
                    //Google
                    GIDSignIn.sharedInstance.handle(url)
                }
            })
        }
    }
}
