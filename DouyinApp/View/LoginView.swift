//
//  LoginView.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var mobile: String = ""
    @State var code: String = ""
    
    var body: some View {
        VStack {
            Section {
                
                Text("欢迎登录使用抖音")
                    .font(.title)
                
                TextField("nickname", text: $mobile)
                    .frame(height: 44)
                    .padding(.horizontal, 10)
                    .mainBackground()
                    .disabled(mobile.count > 11)
                
                TextField("password", text: $code)
                    .frame(height: 44)
                    .padding(.horizontal, 10)
                    .mainBackground()
                    .disabled(code.count > 16)
                
                HStack {
                    Text("忘记密码")
                    Spacer()
                    Text("注册")
                }
                
                Button("Login", action: buttonAction)
                    .mainButtonStyle()
            }
            .padding(20)
            .foregroundColor(Color.white)
        }
        .background(Image(uiImage: .image3))
    }
    
    func buttonAction() {
        Networking.shared.request(target: .login(phone: "", code: ""), Model<LoginModel>.self)
            .sink(receiveCompletion: { com in
                print(com)
            }, receiveValue: { str in
                print(str)
                kAccount.jwt = str.data?.jwt
            })
            .store(in: &Networking.shared.anyCancellable)
    }
}

#Preview {
    LoginView()
}
