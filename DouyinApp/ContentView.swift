//
//  ContentView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var account = kAccount
    
    @State var isLogin = false
    
    var body: some View {
        ZStack {
            if isLogin {
                TabbarView()
            } else {
                LoginView()
            }
        }
        .onReceive(account.jwt.publisher, perform: { str in
            withAnimation {
                isLogin = str.count > 0
            }
        })
    }
}

#Preview {
    ContentView()
}
