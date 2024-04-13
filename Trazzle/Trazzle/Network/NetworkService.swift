//
//  NetworkService.swift
//  Trazzle
//
//  Created by 홍주연 on 4/13/24.
//

import Moya
import CombineMoya
import Combine

class NetworkService {
    static let shared = NetworkService()
    static var cancelable = Set<AnyCancellable>()
    private let provider: MoyaProvider<TrazzleAPI>
    
    init() {
        provider = MoyaProvider<TrazzleAPI>()
    }
    
    func kakaoLogin(accessToken: String) -> AnyPublisher<TZResult<User>, TZError> {
        return request(.kakaoLogin(accessToken: accessToken), type: User.self)
    }
}

extension NetworkService {
    private func request<T:Codable>(_ target: TrazzleAPI,
                                    type: T.Type,
                                    showIndicator: Bool = true) -> AnyPublisher<TZResult<T>, TZError> {
        if showIndicator {
            // 로딩바 돌리기
        }
        return provider
            .requestPublisher(target)
            .tryMap { response in
                let response = try response.map(T.self)
                return TZResult.success(response)
            }
            .mapError { error in
                return TZError(code: "", message: error.localizedDescription)
            }
            .eraseToAnyPublisher()
//            .sink(receiveCompletion: { completion in
//                switch completion{
//                case .finished:
//                    print("RECEIVE VALUE COMPLETED")
//                case .failure:
//                    print("RECEIVE VALUE FAILED")
//                }
//            }, receiveValue: { response in
//                do {
//                    let response = try response.map(TZResponse<T>.self)
//                    if let data = response.data {
//                        return .success(data)
//                    } else {
//                        return .failure(TZError(code: "", message: "데이터 포맷이 올바르지 않습니다."))
//                    }
//                }
//                catch {
//                    return .failure(TZError(code: "", message: "데이터 포맷이 올바르지 않습니다."))
//                }
//            })
           
//            .store(in: &NetworkService.cancelable)
    }
}
