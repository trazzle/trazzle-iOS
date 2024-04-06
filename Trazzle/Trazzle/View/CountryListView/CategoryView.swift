//
//  CategoryView.swift
//  Trazzle
//
//  Created by joomin on 3/29/24.
//

import SwiftUI

struct CategoryView: View {
    let countryName: String

    @State private var isTapped = false
    
    var body: some View {
        
        VStack {
            Text(countryName)
                .padding()
                .frame(height: 34)
                .background(Color.white)
                .cornerRadius(32)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(isTapped ? Color.mainGreen : Color.white, lineWidth: 2)
                )
                .onTapGesture {
                    isTapped.toggle()
                }
        }
        .frame(height: 36)
        
    }
}

