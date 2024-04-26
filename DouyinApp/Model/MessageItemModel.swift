//
//  MessageItemModel.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/26.
//

import Foundation

struct MessageItemModel: Codable, Identifiable {
    var id: String = UUID().uuidString
    var user_id: String?
    var image: String?
    var title: String?
    var des: String?
    var number: Int?
    var time: String?
}
