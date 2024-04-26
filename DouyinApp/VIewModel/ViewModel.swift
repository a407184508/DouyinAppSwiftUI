//
//  ViewModel.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/26.
//

import Foundation

class ViewModel: NSObject, ObservableObject {
    
    @Published var homeList: [HomeItemModel] = []
    
    func getHome() {
        Networking.shared.request(target: .opus(type: 1), Model<[HomeItemModel]>.self)
            .sink { com in
                print(com)
            } receiveValue: { data in
//                print(data)
                self.homeList  = data.data ?? []
            }
            .store(in: &Networking.shared.anyCancellable)
    }
    
    
    @Published var messageList: [MessageItemModel] = []
    
    func getMessages() {
        Networking.shared.request(target: .messageList, Model<[MessageItemModel]>.self)
            .sink { com in
                print(com)
            } receiveValue: { data in
                self.messageList  = data.data ?? []
            }
            .store(in: &Networking.shared.anyCancellable)
    }
    
    @Published var chatList: [ChatItemModel] = []
    
    func getChats(_ user_id: String?) {
        Networking.shared.request(target: .messageChat(user_id: user_id ?? ""), Model<[ChatItemModel]>.self)
            .sink { com in
                print(com)
            } receiveValue: { data in
                self.chatList  = data.data ?? []
            }
            .store(in: &Networking.shared.anyCancellable)
    }
}
