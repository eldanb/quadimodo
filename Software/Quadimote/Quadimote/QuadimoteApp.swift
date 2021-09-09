//
//  QuadimoteApp.swift
//  Quadimote
//
//  Created by Eldan Ben Haim on 16/05/2021.
//

import SwiftUI
import Network

class AppDelegate : NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        MotionManager.instance.suspend()
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        MotionManager.instance.resume()
    }
}

@main
struct QuadimoteApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
