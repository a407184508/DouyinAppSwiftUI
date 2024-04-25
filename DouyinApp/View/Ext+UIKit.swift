//
//  Ext+UIKit.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import UIKit

public extension UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = NotiManager.shared
    }
}

public extension UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = NotiManager.shared
    }
}

