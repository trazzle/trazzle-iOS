//
//  TZImageView.swift
//  Trazzle
//
//  Created by 홍주연 on 4/14/24.
//

import SwiftUI

struct TZImageView: View {
    @ObservedObject private var imageViewModel: ImageViewModel
    
    let defaultImage: UIImage
    
    init(urlString: String?) {
        defaultImage = UIImage(systemName: "person.fill") ?? UIImage()
        imageViewModel = ImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageViewModel.image ?? defaultImage)
            .resizable()
            .scaledToFit()
    }
}
