//
//  HomeItemModel.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/26.
//

import Foundation

struct HomeItemModel: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String?
    var image: String?
//    var user_id: String?
//    var is_follow: Int?
//    var is_video: Int?
    var video_url: String?
    var photos: String?
    var des: String?
    var time: String?
}

extension HomeItemModel {
    
    func arrPhotots() -> [String] {
        photos?.components(separatedBy: "|") ?? []
    }
}

