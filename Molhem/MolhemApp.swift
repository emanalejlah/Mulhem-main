//
//  MolhemApp.swift
//  Molhem
//
//  Created by eman alejilah on 18/10/1444 AH.
//

import SwiftUI
import FirebaseCore
import Firebase
import UserNotifications
import FirebaseMessaging
import RevenueCat


@main
struct MolhemApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init(){
        Purchases.configure(withAPIKey: "appl_LeRSAOxLHKOzLwLdDTceYKSIYFn")
        Purchases.logLevel = .verbose
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            FirebaseApp.configure()
            return true
        }
    }
    
  
    var body: some Scene {
        WindowGroup {
            let persistenceController = PersistenceController.shared
            
            LaunchScreenView()
//                .environmentObject(ChatGPTMODEL())
//                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
        }
    }
}

//    Implement App delegate
class AppDelegate: NSObject,UIApplicationDelegate{
    
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       
        FirebaseApp.configure()
        
        
        //  set messaging delegate (to recive registration token )
        Messaging.messaging().delegate = self
        
        
        //  for (remot natfication) show the permission diagoal
//         UNUserNotificationCenter manage all notification-related behaviors in your app or app extension
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { _, _ in }
        )


           application.registerForRemoteNotifications()
        //        register for notification(registration token )
//   Call this method to initiate the registration process with Apple Push Notification service. If registration succeeds, the app calls your app delegate object

        return true
    }
    
    
    
    
    
//
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
      -> UIBackgroundFetchResult {
          //   لما يكون المستخدم برا التطبيق بطلع الاشعار بالBackgronud
       

               
                // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      print(userInfo)

      return UIBackgroundFetchResult.newData
    }
    
//Tells the delegate when Apple Push Notification service cannot successfully complete the registration process.
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
            
        

    //    Tells the delegate that the app successfully registered with Apple Push Notification service
        }
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        }

    }

extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")

      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
        //   store token in firestore for seending notifations
      //  send token to application server.
   
    }

}

//  protocol to handle user-selected actions from notifications, and to process notifications that arrive when your app is running in the foreground
extension AppDelegate: UNUserNotificationCenterDelegate {
  // Receive displayed notifications
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification) async
    -> UNNotificationPresentationOptions {
    let userInfo = notification.request.content.userInfo

   
    print(userInfo)

    
    return [[.alert, .badge, .sound]]
  }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse) async {
    let userInfo = response.notification.request.content.userInfo
      

    print(userInfo)
  }
}
