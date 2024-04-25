//
//  AccountManager.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import Foundation

let kAccount = AccountManager.sheard

class AccountManager: NSObject, ObservableObject {
    
    static let sheard = AccountManager()
    
    @Published var jwt: String?
    
    private override init() {
        
    }
}

