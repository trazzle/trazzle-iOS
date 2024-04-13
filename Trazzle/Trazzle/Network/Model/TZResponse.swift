//
//  TZResponse.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Foundation

struct TZResponse<T: Codable> : Codable {
    let data: T?
//    let errorData: ErrorData?
    
    enum CodingKeys: String, CodingKey {
        case data
//        , errorData
    }
    
    init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy:CodingKeys.self)
        self.data = try values.decode(T.self, forKey: .data)
//        self.errorData = try values.decode(ErrorData.self, forKey: .errorData)
    }
    
//    struct ErrorData: Codable {
//        let status: Int
//        let timestamp: String
//        let errors: [String:Any]
//        
//        enum CodingKeys: String, CodingKey {
//            case status, timestamp, errors
//        }
//        
//        init(from decoder: any Decoder) throws {
//            let values = try decoder.container(keyedBy:CodingKeys.self)
//            self.status = try values.decode(Int.self, forKey: .status)
//            self.timestamp = try values.decode(String.self, forKey: .timestamp)
//            self.errors = try values.decode([String:Any].self, forKey: .errors)
//        }
//    }
    
    
}

