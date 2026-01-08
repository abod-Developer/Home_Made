//
//  HomeMadeApp.swift
//  HomeMade
//
//  Created by user1 on 07/06/1447 AH.
//

import SwiftUI
import Supabase

//هذا السطر نفسه الملف الي نضيفه من فاير بيس
class SupabaseConfig{
    static let client = SupabaseClient(
        supabaseURL: URL(string: "https://okzqtaathrworvyckyme.supabase.co/")!,
        supabaseKey: "sb_publishable_Z9ELjZ3FyE6GIIyaAp_UNA_cpqMEoEm"
    )
}

@main
struct HomeMadeApp: App {
    @StateObject var authVM = AuthViewModel()
    // register app delegate for firebase setup
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {

            RootView()
                .environmentObject(authVM)
        }
    }
}
