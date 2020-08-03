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
        
        setupTheme()
        
        let navigationController = UINavigationController()
        let viewController = CoursesListRouter.setupModule(navigationController: navigationController)
        navigationController.setViewControllers([viewController], animated: true)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        
        return true
    }

}

private extension AppDelegate {
    func setupTheme() {
        // NavigationBar
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().isTranslucent = false
    }
}
