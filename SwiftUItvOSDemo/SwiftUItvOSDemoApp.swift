//
//  SwiftUItvOSDemoApp.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import SwiftUI

@main
struct SwiftUItvOSDemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Network.reachability = try? Reachability(hostname: "www.google.com")
        return true
    }
}
