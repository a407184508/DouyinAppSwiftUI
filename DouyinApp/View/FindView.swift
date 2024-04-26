//
//  FindView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct FindView: View {
    
    @ObservedObject var objc = ViewModel()
    
    var body: some View {
        NavigationView(content: {
            List {
                ForEach(objc.homeList) { item in
                    VStack {
                        VStack {
                            HStack {
                                Image("image\(arc4random_uniform(99) + 1)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                
                                Text(item.title ?? "")
                                
                                Spacer()
                                
                                Text(item.time ?? "")
                            }
                        }
                        
                        Text(item.des ?? "")
                        
                        Opus(item)
                    }
                }
            }
            .task {
                objc.getHome()
            }
            .listStyle(PlainListStyle())
            .navigationTitle("朋友圈")
            .navigationBarTitleDisplayMode(.inline)
            
        })

    }
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: .infinity)),
                   GridItem(.adaptive(minimum: 100, maximum: .infinity)),
                   GridItem(.adaptive(minimum: 100, maximum: .infinity))]
    
    func Opus(_ item: HomeItemModel) -> some View {
        LazyVGrid(columns: columns) {
            ForEach(0...item.arrPhotots().count, id: \.self) {index in
                Color.clear
                    .aspectRatio(1, contentMode: .fill)
                    .overlay {
                        Image("image\(arc4random_uniform(19) + 1)")
                            .resizable()
                            .clipped()
                            .aspectRatio(contentMode: .fill)
                    }
                    .clipped()
            }
        }
    }
}

#Preview {
    NavigationStack {
        FindView()
    }
}
