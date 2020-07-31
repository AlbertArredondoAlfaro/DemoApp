//
//  AppDelegate.swift
//  DomestikaTrailers
//
//  Created by Albert Arredondo Alfaro on 30/07/2020.
//  Copyright © 2020 Albert Arredondo Alfaro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let viewController = CoursesListRouter.setupModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        
        return true
    }

}

