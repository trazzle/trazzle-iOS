//
//  ProfileEditViewModel.swift
//  Trazzle
//
//  Created by 연승주 on 4/15/24.
//

import Combine
import SwiftUI

class ProfileEditViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    
    var user: User
    
    init(user: User) {
        self.user = user
    }

    // 프로필 수정
    func requestEditProfile(profileBio: String, image: UIImage?) {
//        if var base64 = image?.base64(maxSize: 512) {
//            base64 = "data:image/jpeg;base64," + base64
//            let imageUrl = base64.replacingOccurrences(of: "+", with: "%2B")
//            NetworkService.shared.editProfile(name: user.name,
//                                              intro: profileBio,
//                                              profileImageFile: imageUrl)
//            .sink(receiveCompletion: { error in
//                switch error {
//                case .finished:
//                    //  성공
//                    print("finish")
//                case .failure(let failure):
//                    print("fail \(failure.localizedDescription)")
//                }
//                
//            }, receiveValue: { result in
//                switch result {
//                case .success(let data):
//                    print("login success: \(data)")
//                case .failure(let error):
//                    print(error.message)
//                }
//            })
//            .store(in: &cancellable)
//        }
    }
    
}

