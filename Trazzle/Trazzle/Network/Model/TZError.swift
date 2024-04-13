//
//  TZError.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

struct TZError: Error {
    var code: String
    var message: String = ""
}
