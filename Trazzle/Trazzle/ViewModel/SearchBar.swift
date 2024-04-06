//
//  SearchBar.swift
//  Trazzle
//
//  Created by joomin on 3/28/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    let placeHoler: String
    
    init(searchText: Binding<String>, placeHolder: String) {
        self._searchText = searchText
        self.placeHoler = placeHolder
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
                .fill(Color.white) // 백그라운드 색상을 흰색으로 설정
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.g100, lineWidth: 1)
                )
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 52)
                .overlay(
                    HStack {
                        TextField(placeHoler, text: $searchText)
                            .foregroundColor(.black)
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        
                    }.padding(14)
                )
    }
}
