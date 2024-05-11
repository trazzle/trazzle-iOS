//
//  UIColor+Extension.swift
//  Trazzle
//
//  Created by 홍주연 on 5/11/24.
//

import UIKit

extension UIColor {
    // init hexString
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let scanner = Scanner(string: hexString)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha:alpha)
    }
}
