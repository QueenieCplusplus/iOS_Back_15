//
//  AppDelegate.swift
//  KatesPushNotifyApp
//
//  Created by KatesAndroid on 2021/1/29 AM 9:50 - 10: 20
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 推播中心的迸發執行緒
        // ask user the autherization
        let nc = UNUserNotificationCenter.current()
        nc.delegate = self
        
        nc.requestAuthorization(options: [.alert, .sound, .badge]){
            
            (granted, error) in
            if granted == false {
                print(" 權限不足，Auth is limited.")
            }
            
        }
        
        notifyUser()
        return true
    }
    
    // design the notify body
    
    func notifyUser(){
        
        let txt = UNMutableNotificationContent()
        txt.title = "這是來自 Kate 的推播放喔！"
        txt.body = "普普貓問：今天有定時定樣餵食我嗎？"
        txt.badge = 3
        txt.sound = UNNotificationSound.default
        
        let tg = UNTimeIntervalNotificationTrigger(timeInterval: 61, repeats: true)
        let req = UNNotificationRequest(identifier: "mytargetid", content: txt, trigger: tg)
    
        // 推播中心的迸發執行緒
        let nc = UNUserNotificationCenter.current()
        nc.delegate = self
        nc.add(req)
    
    }
    
    // 上方為銀幕鎖上或是 Home 時的推播狀態設定。
    // 前景 app 出現本地推播通知要額外實作 userNotificationCenter。
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

