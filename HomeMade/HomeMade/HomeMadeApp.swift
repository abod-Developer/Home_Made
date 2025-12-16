//
//  HomeMadeApp.swift
//  HomeMade
//
//  Created by user1 on 07/06/1447 AH.
//

import SwiftUI
import FirebaseCore

class AppDelegate : NSObject, UIApplicationDelegate{
    func application(_ application : UIApplication, didFinishLaunchingWithOptions LaunchOptions : [UIApplication.LaunchOptionsKey : Any]? = nil ) -> Bool{
        
        FirebaseApp.configure()
        return true
    }
}

@main
struct HomeMadeApp: App {
    // register app delegate for firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
//            ContentView()
            //SignInView()
            SignupView()
           // HomeView()
        }
    }
}
