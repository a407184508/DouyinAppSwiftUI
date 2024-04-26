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
    
    func request<T: Codable>(target: Api, _ type: T.Type) -> AnyPublisher<T, MoyaError>  {
        return provider.requestPublisher(target)
            .mapModel(T.self)
            .eraseToAnyPublisher()
    }
}

extension AnyPublisher where Output == Response {
    
    func mapModel<T: Codable>(_ type: T.Type) -> AnyPublisher<T, MoyaError> {
        tryMap { element in
            let data = try JSONDecoder().decode(T.self, from: element.data)
            debugPrint(element.data.string(encoding: .utf8)!)
            return data
        }
        .mapError { error in
            return .underlying(error, nil)
        }
        .eraseToAnyPublisher()
    }
}


