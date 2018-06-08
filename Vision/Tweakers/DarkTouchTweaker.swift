//
//  DarkTouchTweaker.swift
//  Vision
//
//  Created by Sergio Lozano García on 6/6/18.
//  Copyright © 2018 Sergio Lozano García. All rights reserved.
//

import Foundation

class DarkTouchTweaker {
    
    static let color = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    
    static func setDarkMode(viewController: UIViewController) -> Void {
        viewController.view.backgroundColor = DarkTouchTweaker.color
        
        viewController.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        
        viewController.navigationController?.navigationBar.tintColor = UIColor.white
        viewController.navigationController?.navigationBar.barStyle = UIBarStyle.black
        viewController.tabBarController?.tabBar.barStyle = UIBarStyle.black
        viewController.tabBarController?.tabBar.tintColor = UIColor.red
    }
    
}
