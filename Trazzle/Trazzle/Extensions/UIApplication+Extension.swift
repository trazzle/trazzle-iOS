//
//  UIApplication+Extension.swift
//  Trazzle
//
//  Created by 홍주연 on 4/14/24.
//

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
           // Get connected scenes
           return self.connectedScenes
               // Keep only active scenes, onscreen and visible to the user
               .filter { $0.activationState == .foregroundActive }
               // Keep only the first `UIWindowScene`
               .first(where: { $0 is UIWindowScene })
               // Get its associated windows
               .flatMap({ $0 as? UIWindowScene })?.windows
               // Finally, keep only the key window
               .first(where: \.isKeyWindow)
       }
    
    func hideKeyboard() {
        guard let window = keyWindow else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
 }
 
extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, 
                                  shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
