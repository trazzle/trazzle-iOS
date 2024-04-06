//
//  User.swift
//  Trazzle
//
//  Created by joomin on 3/30/24.
//

import Foundation

struct User: Codable {
    let access_token: String
    let id: Int
    let account: String
    let name: String
    let profileImageURL: String?
    let intro: String?
}
