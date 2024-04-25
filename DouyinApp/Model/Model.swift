//
//  Model.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import Foundation

struct Model<T: Codable>: Codable {
    var data: T?
    var msg: String?
    var code: String?
}

struct LoginModel: Codable {
    var jwt: String?
}
