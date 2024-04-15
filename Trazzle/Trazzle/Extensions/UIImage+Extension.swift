//
//  UIImage+Extension.swift
//  Trazzle
//
//  Created by 홍주연 on 4/15/24.
//

import UIKit

extension UIImage {
    
    func scale(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0.0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)

        context?.draw(self.cgImage!, in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return scaledImage
    }
    
    func base64(maxSize: CGFloat) -> String? {
        //        let maxSize: CGFloat = 512.0
        var photoSize = self.size
        if self.size.width > maxSize || self.size.height > maxSize {
            if self.size.width >= self.size.height {
                photoSize = CGSize(width: maxSize, height: self.size.height * (maxSize / self.size.width))
            } else {
                photoSize = CGSize(width: self.size.width * (maxSize / self.size.height), height:maxSize)
            }
        }
        let resizeImage = scale(to: photoSize)
        let resizeDate = resizeImage?.jpegData(compressionQuality: 0.8)
        if let resizeDate = resizeDate {
            //            print(ByteCountFormatter().string(fromByteCount: Int64(resizeDate.count)))
            let countBytes = ByteCountFormatter()
            countBytes.allowedUnits = [.useKB]
            countBytes.countStyle = .file
            let fileSize = countBytes.string(fromByteCount: Int64(resizeDate.count))
            
            print("size \(fileSize)")
        }
        let base64Data = resizeDate?.base64EncodedString()
        return base64Data
    }
    
}
