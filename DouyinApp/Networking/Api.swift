//
//  Api.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/24.
//

import Foundation
import Moya

enum Api {
    case login(phone: String, code: String)
    case register(phone: String, code: String)
    
    case user(user_id: String)
    case userList(type: Int)
    
    case opus(type: Int)
    
    case messageList
    case messageChat(user_id: String)
}

extension Api: TargetType {
    var baseURL: URL {
        URL(string: "http://rap2api.taobao.org")!
    }
    
    var path: String {
        switch self {
        case .login: return "/app/mock/318565/login"
        case .opus: return "/app/mock/318565/opus"
        case .messageList: return "/app/mock/318565/messageList"
        case .messageChat: return "/app/mock/318565/messageChat"
        default: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default: 
            return .get
        }
    }
    
    var task: Moya.Task {
        var dic: [String: Any] = [:]
        switch self {
        case let .login(phone, code):
            dic["phone"] = phone
            dic["code"] = code
        case let .opus(type):
            dic["type"] = type
        case let .messageChat(user_id):
            dic["user_id"] = user_id
        default: break
        }
        return .requestParameters(parameters: dic, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        var dic: [String: String] = [:]
        if let jwt = kAccount.jwt {
            dic["jwt"] = jwt
        }
        return dic
    }
}
