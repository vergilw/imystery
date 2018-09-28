//
//  AppDelegate.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/28.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        let playbooksNavigationController = BaseNavigationController(rootViewController: PlaybooksViewController())
        let playbooksImg = UIImage(named: "tab_playbooks")?.withRenderingMode(.alwaysTemplate).byResize(to: CGSize(width: 24, height: 24))
        playbooksNavigationController.tabBarItem = UITabBarItem(title: "剧本", image: playbooksImg, tag: 0)
        playbooksNavigationController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)], for: .normal)
        playbooksNavigationController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        let authorsNavigationController = BaseNavigationController(rootViewController: AuthorsViewController())
        let authorsImg = UIImage(named: "tab_authors")?.withRenderingMode(.alwaysTemplate).byResize(to: CGSize(width: 24, height: 24))
        authorsNavigationController.tabBarItem = UITabBarItem(title: "作者", image: authorsImg, tag: 1)
        authorsNavigationController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .medium)], for: .normal)
        authorsNavigationController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -1)
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = UIColor("#333")
        tabBarController.tabBar.unselectedItemTintColor = UIColor("#999")
        tabBarController.setViewControllers([playbooksNavigationController, authorsNavigationController], animated: true)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        UISearchBar.appearance().tintColor = UIConstants.primary.color
        
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

