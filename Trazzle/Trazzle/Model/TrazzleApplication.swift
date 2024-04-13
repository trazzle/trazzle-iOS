//
//  TrazzleApplication.swift
//  Trazzle
//
//  Created by 홍주연 on 3/31/24.
//

import SwiftUI

class TrazzleApplication {
    static func getNotchHeight() -> CGFloat? {
        return UIApplication.shared.connectedScenes.first?.inputView?.safeAreaLayoutGuide.layoutFrame.height
    }
}
