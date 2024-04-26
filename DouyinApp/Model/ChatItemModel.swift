//
//  ChatItemModel.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/26.
//

import Foundation

struct ChatItemModel: Codable, Identifiable {
    var id: String = UUID().uuidString
    var name: String?
    var image: String?
    var msg: String?
    var time: String?
    var is_send: Bool?
    var type: Int?
}
