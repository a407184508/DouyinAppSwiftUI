//
//  NotiManager.swift
//  DouyinApp
//
//  Created by macmini-090 on 2024/4/25.
//

import Foundation
import UIKit

final class NotiManager: NSObject {
    static let shared = NotiManager()
    
    private override init() {
        
    }
}

extension NotiManager: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if navigationController.viewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
    }
    
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
//
//    }
}

extension NotiManager: UITabBarControllerDelegate {
    
}
