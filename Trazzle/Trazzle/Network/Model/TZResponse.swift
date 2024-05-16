//
//  TZResponse.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Foundation

struct TZResponse<T: Codable> : Codable {
    let data: T?
    
    let statusCode: Int
    let errorMessage: String?
    let errorDetails: String?
    let path: String?
    let timestamp: String?
    
    enum CodingKeys: String, CodingKey {
        case data
        
        case statusCode
        case errorMessage
        case errorDetails
        case path
        case timestamp
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy:CodingKeys.self)
        self.data = try values.decode(T.self, forKey: .data)
        
        self.statusCode = try values.decode(Int.self, forKey: .statusCode)
        self.errorMessage = try values.decode(String.self, forKey: .errorMessage)
        self.errorDetails = try values.decode(String.self, forKey: .errorDetails)
        self.path = try values.decode(String.self, forKey: .path)
        self.timestamp = try values.decode(String.self, forKey: .timestamp)
    }
}

