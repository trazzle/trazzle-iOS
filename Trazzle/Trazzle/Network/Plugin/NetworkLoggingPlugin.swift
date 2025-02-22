//
//  NetworkLoggingPlugin.swift
//  Trazzle
//
//  Created by 홍주연 on 5/4/24.
//

import Moya

class NetworkLoggingPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        guard let httpRequest = request.request else {
            print("--> invalid request")
            return
        }
        
        let url = httpRequest.description
        let method = httpRequest.httpMethod ?? "unknown method"
        
        var log = "--> \(method) \(url)\n"
        log.append("API: \(target)\n")
        
        if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
            log.append("header: \(headers)\n")
        }
        
        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
            log.append("\(bodyString)\n")
        }
        
        log.append("--> END \(method)")
        print(log)
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        switch result {
        case let .success(response):
            onSuceed(response, target: target, isFromError: false)
        case let .failure(error):
            onFail(error, target: target)
        }
    }
    
    func onSuceed(_ response: Response, target: TargetType, isFromError: Bool) {
        let request = response.request
        let url = request?.url?.absoluteString ?? "nil"
        let statusCode = response.statusCode
        
        var log = "<-- \(statusCode) \(url)\n"
        log.append("API: \(target)\n")
        
        response.response?.allHeaderFields.forEach {
            log.append("\($0): \($1)\n")
        }
        print(log)
        log = ""
        
        if let reString = String(bytes: response.data, encoding: String.Encoding.utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) {
            log.append("\(reString)\n")
        }
        
        log.append("<-- END HTTP (\(response.data.count)-byte body)")
        print(log)
    }
    
    func onFail(_ error: MoyaError, target: TargetType) {
        if let response = error.response {
            onSuceed(response, target: target, isFromError: true)
            return
        }
        
        var log = "<-- \(error.errorCode) \(target)\n"
        log.append("\(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
        log.append("<-- END HTTP")
        print(log)
    }
}
