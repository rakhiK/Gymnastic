//
//  AppDelegate.swift
//  Gymnastics
//
//  Created by Rakhi on 9/7/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().shouldShowTextFieldPlaceholder = false
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        if UserDefaults.standard.string(forKey: "ISLOGIN") != "YES"
        {
            let obj = storyBoard.instantiateViewController(withIdentifier: "firstController") as! ViewController
            let nav = UINavigationController(rootViewController: obj)
            self.window?.rootViewController = nav
            self.window?.makeKeyAndVisible()
        }
        

        return true
    }
    func sharedInstance() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    func setTabbar()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let objHome = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let objVideos = storyBoard.instantiateViewController(withIdentifier: "VideosVC") as! VideosVC
        let objPlaylist = storyBoard.instantiateViewController(withIdentifier: "PlaylistVC") as! PlaylistVC
        let objProfile = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
 
        let navHome = UINavigationController.init(rootViewController: objHome)
        let navVideos = UINavigationController.init(rootViewController: objVideos)
        let navPlaylist = UINavigationController.init(rootViewController: objPlaylist)
        let navProfile = UINavigationController.init(rootViewController: objProfile)
        
       // let tabbar = UITabBarController()
        let tabbar:UITabBarController = storyBoard.instantiateViewController(withIdentifier:"tabbarcontroller") as! UITabBarController
        tabbar.viewControllers = [navHome,navVideos,navPlaylist,navProfile]
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected \(viewController.title!)")
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

