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
            NavigationStack(root: {
                HomeView()
            })
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            
            NavigationStack(root: {
                FindView()
            })
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

            NavigationStack(root: {
                MyView()
            })
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
