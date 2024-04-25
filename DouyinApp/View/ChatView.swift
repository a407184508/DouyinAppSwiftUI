//
//  ChatView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI
import SwifterSwift

struct ChatView: View {
    
    @State var sendText: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(1...20, id: \.self) { index in
                
                    if index % 2 == 0 {
                        HStack(alignment: .top) {
                            Image("image\(index)")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
                            
                            Text("dis" * Int(arc4random_uniform(100)))
                                .padding()
                                .mainBackground(Color.green)
                                .padding(.trailing, 50)
                        }
                    } else {
                        HStack(alignment: .top) {
                            Spacer()
                            
                            Text("dis" * Int(arc4random_uniform(100)))
                                .padding()
                                .mainBackground()
                                .padding(.leading, 50)
                            
                            Image("image\(index)")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fit)
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
                
                Button("发送") {}
                    .buttonStyle(BorderedButtonStyle())
            }
            .padding()
        }
        
    }
}

#Preview {
    ChatView()
}
