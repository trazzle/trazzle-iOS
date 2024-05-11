//
//  ProfileHeaderView.swift
//  Trazzle
//
//  Created by 홍주연 on 2024/03/29.
//
// https://trazzle.p-e.kr/api-docs#/

import SwiftUI

struct ProfileHeaderView: View {
    
    @Binding var user: User

    let itemWidth: CGFloat = ((UIScreen.main.bounds.width / 2) - (16 * 2) - 7) / 2
    let columns = [GridItem(.adaptive(minimum: 160))]
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    TZImageView(urlString: user.profileImageURL ?? "")
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.homeBgColor,
                                                 lineWidth: 1))
                        .frame(width: 68, height: 68)
                    
                    Spacer().frame(width: 15)
                    CountryStatisticView(isRecordView: true)
                        .frame(height: 68)
                }
                .padding(.top, 12)
                
                Spacer().frame(height: 16)
                HStack {
                    Text(user.name)
                        .foregroundColor(.g900)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("수집한 마그넷 수: 6")
                        .foregroundColor(.g500)
                        .font(.system(size: 12, weight: .light))
                        .frame(alignment: .bottomLeading)
                }
                Spacer().frame(height: 16)
                Text(user.intro ?? "")
                    .foregroundColor(.g700)
                    .font(.system(size: 14, weight: .regular))
                Spacer().frame(height: 20)
            }
            .padding([.leading, .trailing], 16)
        }
        .background(.white)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: .constant(User(access_token: "", id: 0, account: "",
                                               name: "홍주연", profileImageURL: nil, intro: nil)))
    }
}
