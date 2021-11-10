//
//  AppDelegate.swift
//  property-listing-ios
//
//  Created by Evan Beh on 06/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator : AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: self.window!)
        appCoordinator.start()
        styling()
      
        
        return true
    }



}

extension AppDelegate
{
    func styling()
    {
        
        UINavigationBar.appearance().standardAppearance = getstyle1()
        UINavigationBar.appearance().scrollEdgeAppearance = getstyle2()
        
        
    }
}
