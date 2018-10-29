//
//  AppDelegate.swift
//  Series
//
//  Created by ÁLVARO BARRADO FERNÁNDEZ on 1/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window{
            
            window.tintColor = UIColor.white
            
            UINavigationBar.appearance().barTintColor = UIColor.black
            UITabBar.appearance().barTintColor = UIColor.black
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, kCTFontAttributeName : UIFont(name: "SpicyRice-Regular", size: 26)] as? [NSAttributedStringKey : Any]
            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, kCTFontAttributeName : UIFont(name: "SpicyRice-Regular", size: 26)] as? [NSAttributedStringKey : Any]
            
            let chatsVC = ChatsViewController()
            let contactsVC = ContactsViewController()
            let settingsVC = SettingsViewController()
            let favoritesVC = FavoritesViewController()
            
            let chatsNavigationController = UINavigationController(rootViewController: chatsVC)
            chatsNavigationController.navigationBar.prefersLargeTitles = true
            chatsNavigationController.navigationBar.isTranslucent = false
            let contactsNavigationController = UINavigationController(rootViewController: contactsVC)
            contactsNavigationController.navigationBar.isTranslucent = false
            let settingsNavigationController = UINavigationController(rootViewController: settingsVC)
            settingsNavigationController.navigationBar.isTranslucent = false
            let favoritesNavigationController = UINavigationController(rootViewController: favoritesVC)
            favoritesNavigationController.navigationBar.isTranslucent = false
            
            let tabBarController = UITabBarController()
            tabBarController.tabBar.isTranslucent = false
            tabBarController.viewControllers = [chatsNavigationController, contactsNavigationController, settingsNavigationController, favoritesNavigationController]
            
            window.rootViewController = tabBarController
            window.makeKeyAndVisible()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

