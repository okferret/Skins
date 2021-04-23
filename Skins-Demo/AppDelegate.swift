//
//  AppDelegate.swift
//  Skins-Demo
//
//  Created by tramp on 2021/4/23.
//

import UIKit
import Skins

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    /// didFinishLaunchingWithOptions
    /// - Parameters:
    ///   - application: UIApplication
    ///   - launchOptions: [UIApplication.LaunchOptionsKey: Any]
    /// - Returns: Bool
    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        do {
            guard let url = Bundle.main.url(forResource: "skins", withExtension: "plist") else { return true }
            try Skins.shared.setup(colorType: SKColor.self, fileUrl: url)
        } catch {
            print(error)
        }
        
        return true
    }
    

    
    
}

// MARK: UISceneSession Lifecycle
@available(iOS 13, *)
extension AppDelegate {
    
    /// configurationForConnecting
    /// - Parameters:
    ///   - application: UIApplication
    ///   - connectingSceneSession: UISceneSession
    ///   - options: UIScene.ConnectionOptions
    /// - Returns: UISceneConfiguration
    internal func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    /// didDiscardSceneSessions
    /// - Parameters:
    ///   - application: UIApplication
    ///   - sceneSessions: Set<UISceneSession>
    internal func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
