//
//  MyView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct MyView: View {
    
    @State var isShowExit = false
    
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
                    .font(.largeTitle)
                }
                .padding()
                
                HStack {
                    Image("image\(arc4random_uniform(99) + 1)")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                    
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
            }
            
            VStack {
                HStack {
                    Group {
                        VStack {
                            Text("资料")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                        }
                            .tag(0)
                        VStack {
                            Text("资料")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                        }
                        VStack {
                            Text("资料")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                        }
                        VStack {
                            Text("资料")
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                
                
                Picker("", selection: .constant(0)) {
                    Text("资料")
                        .tag(0)
                    Text("资料")
                    Text("资料")
                    Text("资料")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                opus
            }
            .padding()
            .mainBackground()
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
                        .aspectRatio(0.75, contentMode: .fill)
                        .background {
                            Image("image\(arc4random_uniform(19) + 1)")
                                .resizable()
                                .aspectRatio( contentMode: .fit )
                                .frame(maxWidth: .infinity)
                                .clipped()
                        }
                        .background(Color.black)
                    
                    
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
