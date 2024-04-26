//
//  ChatView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI
import SwifterSwift

struct ChatView: View {
    
    var user_id: String?
    
    @ObservedObject var objc = ViewModel()
    
    @State var sendText: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(objc.chatList) { item in
                
                    if item.is_send ?? false {
                        HStack(alignment: .top) {
                            Image("image\(arc4random_uniform(20) + 1)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                            
                            Text(item.msg ?? "")
                                .padding()
                                .mainBackground(Color.green)
                                .padding(.trailing, 50)
                        }
                    } else {
                        HStack(alignment: .top) {
                            Spacer()
                            
                            Text(item.msg ?? "")
                                .padding()
                                .mainBackground()
                                .padding(.leading, 50)
                            
                            Image("image\(arc4random_uniform(20) + 21)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            
            HStack {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
                
                TextField("说点什么吧...", text: $sendText)
                    .frame(height: 44)
                    .padding(.horizontal)
                    .mainBackground()
                
                Button("发送") {
                    objc.chatList += [ChatItemModel(msg: sendText)]
                }
                    .buttonStyle(BorderedButtonStyle())
            }
            .padding()
        }
        .task {
            objc.getChats(user_id)
        }
    }
}

#Preview {
    ChatView(user_id: "")
}
