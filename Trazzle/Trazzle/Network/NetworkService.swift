//
//  NetworkService.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Moya
import Combine
import Foundation
import CombineMoya

class NetworkService {
    static let shared = NetworkService()
    static var cancelable = Set<AnyCancellable>()
    private let provider: MoyaProvider<TrazzleAPI>
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // 타임아웃 시간 30초로 설정
        configuration.waitsForConnectivity = true // 인터넷 연결 기다렸다가 요청
        
        let session = Session(
            configuration: configuration,
            startRequestsImmediately: false
        )
        
        var plugins: [PluginType] = []
        plugins.append(NetworkLoggingPlugin())
        
        provider = MoyaProvider<TrazzleAPI>(session: session, plugins: plugins)
    }
    
    // MARK: Login
    func kakaoLogin(accessToken: String) -> AnyPublisher<User, TZError> {
        return request(.kakaoLogin(accessToken: accessToken), type: User.self)
    }
    
    func googleLogin(accessToken: String) -> AnyPublisher<User, TZError> {
        return request(.googleLogin(accessToken: accessToken), type: User.self)
    }
    
    func appleLogin(accessToken: String) -> AnyPublisher<User, TZError> {
        return request(.kakaoLogin(accessToken: accessToken), type: User.self)
    }
    
    func testLogin(account: String) -> AnyPublisher<User, TZError> {
        return request(.testLogin(account: account), type: User.self)
    }
    
    // MARK: Profile
    func editProfile(name: String,
                     intro: String,
                     profileImageFile: String) -> AnyPublisher<User, TZError> {
        return request(.editProfile(name: name,
                                    intro: intro,
                                    profileImageFile: profileImageFile), type: User.self)
    }
}

extension NetworkService {
    private func request<T:Codable>(_ target: TrazzleAPI,
                                    type: T.Type,
                                    showIndicator: Bool = true) -> AnyPublisher<T, TZError> {

        if showIndicator {
            TZLoadingView.shared.show()
        }

        // 요청
        return provider.requestPublisher(target)
            .tryCatch { error in
                if (500..<599) ~= error.response?.statusCode ?? 0 {
                    return Just(())
                        .delay(for: 3, scheduler: DispatchQueue.global()) // ✅
                        .flatMap { _ in
                            return self.provider.requestPublisher(target)
                        }
                        .retry(3)
                        .eraseToAnyPublisher()
                } else {
                    throw error
                }
            }
            .mapError { _ in
                return TZError(code: "", message: "오마이갓실패")
            }
            .tryMap { response in
                let decodedData = try response.map(T.self)
                return decodedData
            }
            .mapError { error in
                if let moyaError = error as? MoyaError {
                    return TZError(code: String(moyaError.response?.statusCode ?? 999),
                                   message: moyaError.response?.description ?? "network error")
                } else {
                    return TZError(code: "",
                                   message: error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
//        
//        provider.request(target) { result in
//            if showIndicator {
//                TZLoadingView.shared.hide()
//            }
//            
//            let result = self.makeResult(result, type: T.self)
//            
        }
    
    // Result 형태로 변환
    private func makeResult<T: Codable>(_ result: Result<Response, MoyaError>,
                                        type: T.Type) -> TZResult<T> {
        switch result {
        case .success(let response):
            do {
                let tzResponse = try response.map(TZResponse<T>.self)
                if tzResponse.statusCode == 200 {
                    // 성공
                    if let data = tzResponse.data {
                        return .success(data)
                    } else {
                        // 데이터가 없음
                        let err = TZError(code: "", message: "데이터 포맷이 올바르지 않습니다.")
                        return .failure(err)
                    }
                } else {
                    // 실패
                    let err = TZError(code: String(tzResponse.statusCode),
                                      message: tzResponse.errorDetails ?? "데이터 포맷이 올바르지 않습니다.")
                    return .failure(err)
                }
            } catch {
                // Decodable 실패
                let err = TZError(code: "", message: "데이터 포맷이 올바르지 않습니다.")
                return .failure(err)
            }
            
        case .failure(let error):
            
            // failure 공통 처리
            let err = TZError(code: String(error.errorCode), message: error.localizedDescription)
            return .failure(err)
        }
    }
}
