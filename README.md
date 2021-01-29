# iOS_Back_15
PN, 本地推播


![](https://raw.githubusercontent.com/QueenieCplusplus/iOS_Back_15/main/output%202.png)


1. code.


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


2. ask for auth.

  ![](https://raw.githubusercontent.com/QueenieCplusplus/iOS_Back_15/main/output%201.png)

3. time interval and repeat.

    版主私心：普普貓每 61 秒提醒一次餵食通知。

    ![](https://raw.githubusercontent.com/QueenieCplusplus/iOS_Back_15/main/timeInterval.png)
