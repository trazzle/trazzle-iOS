//
//  TZResult.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

enum TZResult<T: Codable> {
    case success(T)
    case failure(TZError)
}
