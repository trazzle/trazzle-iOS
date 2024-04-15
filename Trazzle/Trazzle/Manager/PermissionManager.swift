//
//  PermissionManager.swift
//  Trazzle
//
//  Created by 홍주연 on 4/15/24.
//

import Foundation
import Photos

enum PermissionsType {
    case gallery
    case video
}

class PermissionsManager {
    
    func requestPermissionsIfNeeded(_ permissions: PermissionsType) {
        switch permissions {
        case .gallery:
            PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
                if status == .authorized {
                    
                } else {
                    // 요청
                }
            }
        case .video:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    print("카메라 권한 승인")
                }
            }
        }
    }

    func isGalleryPermissionAllowed() -> Bool {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        switch authorizationStatus {
        case .notDetermined:
            return false
            
        case .restricted:
            print("카메라 권한 restricted")
            return true
        case .denied:
            // alert
            return false
            
        case .authorized:
            return true
            
        case .limited:
            return true
            
        @unknown default:
            return false
        }
    }

    func isGalleryPermissionAsked() -> Bool {
        PHPhotoLibrary.authorizationStatus(for: .readWrite) == .notDetermined
    }
}
