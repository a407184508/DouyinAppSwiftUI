//
//  FindView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct FindView: View {
    
    
    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                VStack {
                    VStack {
                        HStack {
                            Image("image\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            Text("title")
                            
                            Spacer()
                            
                            Text("time")
                        }
                    }
                    
                    Text("subtitle")
                    
                    opus
//                        .padding(10)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
//    let columns = [GridItem(.flexible()), 
//                   GridItem(.flexible()), 
//                   GridItem(.flexible())]
    
    let columns = [GridItem(.adaptive(minimum: 100, maximum: .infinity)),
                   GridItem(.adaptive(minimum: 100, maximum: .infinity)),
                   GridItem(.adaptive(minimum: 100, maximum: .infinity))]
    
    var opus: some View {
        LazyVGrid(columns: columns) {
            ForEach(0...arc4random_uniform(8), id: \.self) {index in
                Image("image\(arc4random_uniform(19) + 1)")
                    .resizable()
                    .clipped()
                    .aspectRatio(1, contentMode: .fit)
                    
            }
        }
    }
}

#Preview {
    FindView()
}
