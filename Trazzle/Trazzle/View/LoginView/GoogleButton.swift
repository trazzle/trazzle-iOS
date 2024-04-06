//
//  GoogleButton.swift
//  Trazzle
//
//  Created by joomin on 3/26/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct GoogleButton: View {
    
    // GoogleSignInButtonViewModel 인스턴스 생성
    let viewModel = GoogleSignInButtonViewModel()
    let loginSender = LoginSender()
    let googleUrl = "https://trazzle.p-e.kr/api/users/sign-in/google"
    
    var body: some View {
        Button(action: {
            // 버튼을 눌렀을 때 실행할 코드
            handleSignInButton()
        }) {
            // 버튼 내부 뷰
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white) // 백그라운드 색상을 흰색으로 설정
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 221 / 255, green: 225 / 255, blue: 227 / 255), lineWidth: 1) // 테두리 색상을 DDE1E3으로 설정
                )
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 52)
                .overlay(
                    HStack {
                        // 아이콘 이미지 추가
                        Image("google_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        // 텍스트 추가
                        Text("구글로 계속하기")
                            .foregroundColor(.black)
                    }
                )
        }.padding(4)
    }
    
    func handleSignInButton() {
        let signInConfig = GIDConfiguration.init(clientID: "com.googleusercontent.apps.637815114175-1ek25ia415ddh5co26ir60husqpnpqag")
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let result = signInResult else {
                // Inspect error
                print("google result error")
                return
            }
            
            if let user = signInResult?.user {
                // 로그인 성공 시 사용자 정보 출력
                print("Google sign in success!")
                
                // 액세스 토큰
                print("Access token: \(user.accessToken.tokenString)")
                loginSender.sendData(url: googleUrl, accessToken: user.accessToken.tokenString, oauthProvider: "g")
                
                // 토큰을 사용하여 서버에 요청을 보낼 수 있습니다.
            } else {
                print("Google sign in error: Unable to get user information")
            }
        }
    }
}



