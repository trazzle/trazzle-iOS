//
//  TZToast.swift
//  Trazzle
//
//  Created by 홍주연 on 6/6/24.
//

import UIKit
import SnapKit

class TZToast {
    
    class func show(_ message: String, duration: TimeInterval = 2.0) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        let toastView = TZToast().makeToastView(message)
        keyWindow.addSubview(toastView)
        toastView.snp.makeConstraints {
            $0.leading.greaterThanOrEqualTo(keyWindow).offset(40)
            $0.trailing.lessThanOrEqualTo(keyWindow).offset(-40)
            $0.centerX.equalTo(keyWindow)
            $0.bottom.equalTo(keyWindow).offset(-40)
        }
        
        let fadeDuration = 0.5
        toastView.alpha = 0
        UIView.animate(withDuration: fadeDuration) {
            toastView.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: fadeDuration,
                           delay: duration,
                           options: .beginFromCurrentState) {
                toastView.alpha = 0
            } completion: { _ in
                toastView.removeFromSuperview()
            }
            
        }
    }
    
    private func makeToastView(_ message: String) -> UIView {
        // toastView
        let toastView = UIView()
        toastView.layer.cornerRadius = 25
        toastView.backgroundColor = UIColor(hexString: "121616", alpha: 0.65)
        
        // messageLabel
        let messageLabel = UILabel()
        messageLabel.font = .systemFont(ofSize: 16, weight: .regular)
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.text = message
        toastView.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        return toastView
    }
}


