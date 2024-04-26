//
//  HomeView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var selection = 0
    
    let actions = [
        ("heart.fill", "点赞"),
        ("message.fill", "评论"),
        ("star.fill", "收藏"),
        ("square.and.arrow.up.fill", "分享")
    ]
    
    @State var titles = ["关注", "推荐", "热门"]
    @State var selectedTitle = "关注"
    
    @ObservedObject var objc = ViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding()
                
                Picker("", selection: $selectedTitle, content: {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                            .tag(title)
                    }
                })
                .padding()
                .pickerStyle(SegmentedPickerStyle())
                
                Image(systemName: "gear")
                    .padding()
            }
            .task {
                objc.getHome()
            }
            
            GeometryReader { proxy in
                TabView(selection: $selection) {
                    ForEach(objc.homeList) { item in
                        PageView(item)
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .rotationEffect(.degrees(-90))
                }
                .frame(width: proxy.size.height, height: proxy.size.width)
                .rotationEffect(.degrees(90), anchor: .topLeading)
                .offset(x: proxy.size.width)
            }.tabViewStyle(PageTabViewStyle())
            
        }
        
    }
    
    func PageView(_ item: HomeItemModel) -> some View{
        ZStack(alignment: .bottomTrailing) {
            Color.gray.opacity(0.6)
                .overlay {
                    Image("image\(arc4random_uniform(99)+1)")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fill)
                }
                .overlay {
                    VStack {
                        Spacer()
                        LinearGradient(colors: [Color.black, Color.clear], startPoint: .bottom, endPoint: .top)
                            .frame(height: 300)
                    }
                }
            
            VStack {
                Group {
                    // 使用循环来创建VStack
                    ForEach(actions, id: \.0) { action in
                        VStack {
                            Image(systemName: action.0)
                                .font(.largeTitle)
                            Text(action.1)
                                .font(.title3)
                        }
                        .padding() // 可选：添加内边距以提高可读性
                    }
                }
                .foregroundStyle(.white)
            }
            .padding()
            .offset(x: 0, y: -30)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title ?? "")
                    Text(item.des ?? "")
                        .lineLimit(2)
                }
                Spacer()
            }
            .padding()
            .padding(.trailing, 100)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    HomeView()
}
