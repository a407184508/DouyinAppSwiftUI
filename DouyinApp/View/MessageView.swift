//
//  MessageView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct MessageView: View {
    
    @ObservedObject var objc = ViewModel()
    
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(objc.messageList) { item in
                    NavigationLink {
                        ChatView(user_id: item.user_id)
                    } label: {
                        HStack {
                            Image("image\(arc4random_uniform(99) + 1)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(item.title ?? "")
                                Text(item.des ?? "")
                                    .lineLimit(1)
                            }
                            
                            Spacer()
                            
                            Text(item.time ?? "")
                                .layoutPriority(1000)
                        }
                    }

                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("消息")
            .navigationBarTitleDisplayMode(.inline)
        })
        
        .task {
            objc.getMessages()
        }
    }
}

#Preview {
    NavigationStack {
        MessageView()
    }
}
