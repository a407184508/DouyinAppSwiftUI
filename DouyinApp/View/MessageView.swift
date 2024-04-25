//
//  MessageView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(1...20, id: \.self) { index in
                    NavigationLink {
                        ChatView()
                    } label: {
                        HStack {
                            Image("image\(index)")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("title")
                                Text("subtitle")
                            }
                            
                            Spacer()
                            
                            Text("time")
                        }
                    }

                }
            }
            .listStyle(PlainListStyle())
        })
        .navigationTitle("消息")
    }
}

#Preview {
    MessageView()
}
