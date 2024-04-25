//
//  TabbarView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            
            FindView()
            .tabItem {
                Text("Find")
                Image(systemName: "magnifyingglass")
            }
            
            NavigationStack(root: {
                MessageView()
                    .toolbarTitleDisplayMode(.inline)
            })
            .tabItem {
                Text("Message")
                Image(systemName: "envelope")
            }

            
            MyView()
            .tabItem {
                Text("My")
                Image(systemName: "person")
            }
        }
    }
}

#Preview {
    TabbarView()
}
