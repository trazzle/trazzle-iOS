//
//  ProfileEditView.swift
//  Trazzle
//
//  Created by 홍주연 on 4/14/24.
//

import SwiftUI
import Combine
import PhotosUI

struct ProfileEditView: View {
    
    @State var user: User
    @State private var profileBio: String
    @State private var height: CGFloat = 30
    
    private let profileEditVM: ProfileEditViewModel
    
    // imagePicker
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    
    // button
    @State private var isChanged: Bool
    
    init(user: User, _ profileBio: String = "") {
        self.user = user
        self.profileBio = user.intro ?? ""
        self.isChanged = false
        
        profileEditVM = ProfileEditViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .bottom) {
                
                HStack(spacing: 26) {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.homeBgColor,
                                                     lineWidth: 1))
                            .frame(width: 68, height: 68)
                    } else {
                        AsyncImage(url: URL(string: TrazzleApplication.serverUrl + (user.profileImageURL ?? ""))) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.homeBgColor,
                                                         lineWidth: 1))
                                .frame(width: 68, height: 68)
                        } placeholder: {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.homeBgColor,
                                                         lineWidth: 1))
                                .frame(width: 68, height: 68)
                        }
                    }
                    
                    
                    Text(user.name)
                        .foregroundColor(.g900)
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                }
                
                Button(action: {
                    print("프로필 사진 수정 클릭")
                    PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                        if status == .authorized {
                            showImagePicker.toggle()
                        } else {
                            // 요청
                        }
                    }
                    
                }, label: {
                    Image("edit")
                        .renderingMode(.template)
                        .resizable()
                        .foregroundStyle(Color.white)
                        .frame(width: 16, height: 16)
                        .padding(.all, 6)
                        .background(Color.sy800)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,
                                                 lineWidth: 5))
                })
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .padding(.leading, 56)
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    loadImage()
                }, content: {
                    ImagePicker(image: $selectedUIImage)
                })
            }
            // 프로필 메세지 수정 영역
            VStack(spacing: 8) {
                CustomTextView(
                        text: $profileBio,
                        height: $height,
                        maxHeight: 150,
                        textFont: .systemFont(ofSize: 14, weight: .regular),
                        textColor: UIColor(Color.g700),
                        textLimit: 50,
                        placeholder: profileBio.count == 0 ? "소개글을 입력해주세요" : nil
                      )
                .frame(height: height)
                
                // 텍스트 숫자
                Text(" \(profileBio.count) / 50")
                    .foregroundStyle(Color.g200)
                    .font(.system(size: 16, weight: .medium))
                    .frame(maxWidth: .infinity,
                           alignment: .trailing)
            }
            .padding(.all, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.g200, lineWidth: 1)
            )
            
            // 프로필 수정 버튼
            Button(action: {
                print("프로필 수정 버튼 클릭")
                profileEditVM.requestEditProfile(profileBio: profileBio,
                                                 image: selectedUIImage)
                
                
            }, label: {
                Text("프로필 수정").foregroundStyle(Color.g500)
            })
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.g200, lineWidth: 1)
            )
        }
        .padding([.leading, .trailing], 16)
        .padding(.top, 8)
        .padding(.bottom, 20)
    }
}

extension ProfileEditView {
    func limitText(_ upper: Int) {
        if profileBio.count > upper {
            profileBio = String(profileBio.prefix(upper))
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfileEditView(user: .init(access_token: "", id: 1,
                                account: "", name: "홍주연",
                                profileImageURL: "", intro: ""))
}
