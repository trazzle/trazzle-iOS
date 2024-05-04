//
//  TZLoadingView.swift
//  Trazzle
//
//  Created by 홍주연 on 4/16/24.
//

import UIKit
import Lottie
import SnapKit

//@MainActor
class TZLoadingView {
    
    static let shared = TZLoadingView()
    private var isShowing = false
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named("loading")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.backgroundBehavior = .pauseAndRestore
        return animationView
    }()
    
    func show() {
        DispatchQueue.main.async {
            if self.isShowing == false {
                self.isShowing = true
                
                guard let keyWindow = UIApplication.shared.keyWindow else { return }
                
                // backgroundView
                keyWindow.addSubview(self.backgroundView)
                self.backgroundView.snp.makeConstraints {
                    $0.leading.trailing.top.bottom.equalToSuperview()
                }
                // animationView
                self.animationView.play()
                self.backgroundView.addSubview(self.animationView)
                self.animationView.snp.makeConstraints {
                    $0.centerX.centerY.equalToSuperview()
                    $0.width.equalTo(60)
                    $0.height.equalTo(30)
                }
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            if self.isShowing == true {
                self.isShowing = false
                
                // backgroundView
                self.backgroundView.removeFromSuperview()
                
                // animationView
                self.animationView.stop()
                self.animationView.removeFromSuperview()
            }
        }
    }
}

