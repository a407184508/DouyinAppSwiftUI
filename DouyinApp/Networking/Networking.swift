//
//  Networking.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/24.
//

import Foundation
import Moya
import CombineMoya
import Combine

class Networking {
    
    static let shared = Networking()
    
    let provider = MoyaProvider<Api>()
    
    private init() {
        
    }
    
    var anyCancellable = Set<AnyCancellable>()
    
    func request<T: Codable>(_ type: T.Type) -> AnyPublisher<T, MoyaError>  {
        return provider.requestPublisher(.login(phone: "15586831807", code: "123456"))
//            .mapString()
//            .mapJSON()
            .mapModel(T.self)
            .eraseToAnyPublisher()
            
//            .sink { comp in
//                print(comp)
//            } receiveValue: { res in
//                print(res)
//            }
//            .store(in: &anyCancellable)
    }
}

extension AnyPublisher where Output == Response {
    
    func mapModel<T: Codable>(_ type: T.Type) -> AnyPublisher<T, MoyaError> {
        tryMap { element in
            try JSONDecoder().decode(T.self, from: element.data)
        }
        .mapError { error in
            return .underlying(error, nil)
        }
        .eraseToAnyPublisher()
    }
}


