//
//  MyView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct MyView: View {
    
    @State var isShowExit = false
    
    let actions = [
        ("heart.fill", "点赞"),
        ("message.fill", "评论"),
        ("star.fill", "收藏"),
        ("square.and.arrow.up.fill", "分享")
    ]
    
    let titles = ["资料", "作品", "相册", "视频"]
    
    @State var selectedTitle = "资料"
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Group {
                        Button("", systemImage: "magnifyingglass") {
                            
                        }
                        
                        Button("", systemImage: "ellipsis") {
                            isShowExit.toggle()
                        }
                    }
                    .font(.title)
                }
                .padding()
                
                HStack {
                    Image("image\(arc4random_uniform(99) + 1)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .background {
                            Color.red
                                .frame(width: 102, height: 102)
                                .clipShape(Circle())
                        }
                    
                    VStack(alignment: .leading) {
                        Text("nickname")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("douyinid:123456")
                            .font(.title3)
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .foregroundStyle(.white)
            .background {
                Image("image\(arc4random_uniform(99) + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay {
                        LinearGradient(colors: [Color.black.opacity(0.4), Color.clear], startPoint: .top, endPoint: .bottom)
                    }
            }
            
            VStack {
                HStack {
                    Group {
                        ForEach(actions, id: \.0) { item in
                            VStack {
                                Image(systemName: item.0)
                                Text(item.1)
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .mainBackground()
                }
                
                
                Picker("", selection: $selectedTitle) {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .tag(title)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                opus
            }
            .padding()
            .mainBackground(Color.white)
        }
        .alert(Text("是否退出登录"), isPresented: $isShowExit) {
            Button("取消") {}
            
            Button("退出登录") {
                kAccount.jwt = ""
            }
        }
    }
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: .infinity)),
                   GridItem(.adaptive(minimum: 100, maximum: .infinity)),
                   GridItem(.adaptive(minimum: 100, maximum: .infinity))]
    
    var opus: some View {
        LazyVGrid(columns: columns) {
            ForEach(0...arc4random_uniform(100), id: \.self) {index in
                ZStack {
                    Color.clear
                        .frame(maxWidth: .infinity)
                        .aspectRatio(0.75, contentMode: .fill)
                        .overlay {
                            Image("image\(arc4random_uniform(19) + 1)")
                                .resizable()
                                .aspectRatio( contentMode: .fill )
                                .frame(maxWidth: .infinity)
                                .clipped()
                        }
                        .background(Color.black)
                        .clipped()
                    
                    HStack {
                        Image(systemName: "play.fill")
                        Text("\(arc4random_uniform(10000))")
                    }
                    .foregroundStyle(.white)
                    .shadow(radius: 1)
                    .padding(3)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                }
            }
        }
    }
}

#Preview {
    MyView()
}
