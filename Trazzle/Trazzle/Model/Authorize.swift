//
//  File.swift
//  Trazzle
//
//  Created by joomin on 3/30/24.
//

import AuthenticationServices
import Foundation
import SwiftUI

// sign in with apple

class Authorize: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    var anchor: ASPresentationAnchor?
    var anchorProvider: ASAuthorizationControllerDelegate?
    var completionHandler: ((String?) -> Void)?
    
    func authButtonTapped() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        
        request.requestedScopes = [.email, .fullName]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        handleError(error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential {

            if let tokenString = String(data: credential.identityToken ?? Data(), encoding: .utf8) {
                completionHandler?(tokenString)
            }else {
                print("apple token nil")
            }
        
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        
        if let anchor = anchor {
            return anchor
        } else {
            return UIWindow()
        }
    }
    
    
    func handleError(_ error: Error) {
        print("apple login error: \(error)")
    }
}
