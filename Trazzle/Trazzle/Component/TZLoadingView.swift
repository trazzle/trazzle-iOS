//
//  TZLoadingView.swift
//  Trazzle
//
//  Created by 홍주연 on 4/16/24.
//

import UIKit
import Lottie
import SnapKit

@MainActor
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
        if isShowing == false {
            isShowing = true
            
            guard let keyWindow = UIApplication.shared.keyWindow else { return }
            
            // backgroundView
            keyWindow.addSubview(backgroundView)
            backgroundView.snp.makeConstraints {
                $0.leading.trailing.top.bottom.equalToSuperview()
            }
            // animationView
            animationView.play()
            backgroundView.addSubview(animationView)
            animationView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
                $0.width.equalTo(60)
                $0.height.equalTo(30)
            }
        }
    }
    
    func hide() {
        if isShowing == true {
            isShowing = false
            
            // backgroundView
            backgroundView.removeFromSuperview()
            
            // animationView
            animationView.stop()
            animationView.removeFromSuperview()
        }
    }
}
