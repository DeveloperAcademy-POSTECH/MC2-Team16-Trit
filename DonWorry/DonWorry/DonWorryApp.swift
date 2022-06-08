//
//  DonWorryApp.swift
//  DonWorry
//
//  Created by YeongJin Jeong on 2022/05/29.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct DonWorryApp: App {
    
    //AppDelegate를 연결합니다.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}

// FireBase 초기화를 위해 AppDelegate를 추가했습니다.
class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey:Any]? = nil) -> Bool {
        // initializing FireBase
        FirebaseApp.configure()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
