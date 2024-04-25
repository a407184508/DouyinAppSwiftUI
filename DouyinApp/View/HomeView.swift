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
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .padding()
                    .onReceive(Timer.publish(every: 3, on: RunLoop.main, in: .common).autoconnect(), perform: { _ in
                        withAnimation {
                            if self.selection < 101 {
                                self.selection += 1
                            } else {
                                self.selection = Int(arc4random_uniform(99) + 1)
                            }
                        }
                    })
                
                ScrollView(.horizontal) {
                    Picker("", selection: $selection, content: {
                        ForEach(0...100, id: \.self) { index in
                            Text("image\(index)")
                        }
                    })
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Image(systemName: "gear")
                    .padding()
            }
            
            GeometryReader { proxy in
                TabView(selection: $selection) {
                    ForEach(1...100, id: \.self) { index in
                        ZStack(alignment: .bottomTrailing) {
                            Color.gray.opacity(0.6)
                            
                            Image("image\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            
                            actionViwe
                            
                            tip
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .rotationEffect(.degrees(-90))
                    //.rotation3DEffect(flippingAngle, axis: (x: 1, y: 0, z: 0))
                }
                .frame(width: proxy.size.height, height: proxy.size.width)
                //.rotation3DEffect(flippingAngle, axis: (x: 1, y: 0, z: 0))
                .rotationEffect(.degrees(90), anchor: .topLeading)
                .offset(x: proxy.size.width)
            }.tabViewStyle(PageTabViewStyle())
            
        }
        
    }
    
    var tip: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("@nickname")
                Text(" 阿斯蒂芬加上看到了放假阿珂老师的减肥克拉斯京东方快乐阿里客服即可啦时间考虑的飞机卢卡斯都解封了卡就是对方离开啊就是考虑对方")
            }
            Spacer()
        }
        .padding()
        .padding(.trailing, 100)
        .foregroundStyle(.white)
//        .mainBackground()
    }
    
    var actionViwe: some View {
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
//        .mainBackground()
        .offset(x: 0, y: -30)
    }
}

#Preview {
    HomeView()
}
