//
//  AppDelegate.swift
//  MyFitnessApp
//
//  Created by Argeanu Lucian on 29/10/2019.
//  Copyright © 2019 Argeanu Lucian. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
        FirebaseApp.configure()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Firestore.firestore().collection("test").addDocument(data: [  "name": "volare70",
             "title": "Un ristorante frizzante di allegria e buoni piatti",
             "comments": "Abbiamo apprezzato questo locale sia per l'arredamento che per il cibo.\nle decorazioni floreali e i tavolini a forma di fiore danno un tocco di allegria e spensieratezza al ristorante.\nIl personale è molto gentile e si è prodigato per trovarci un tavolo più comodo rispetto a quello assegnato. Il cibo è buono ed è servito con una certa cura nella preparazione dei piatti e i prezzi sono adeguati e non esagerati.\nlo consiglio vivamente..da Plaza Mayor dista davvero poco e quindi una capatina si può fare!\nNon dimenticate di prenotare, è sempre pieno.",
             "rating": "ui_bubble_rating bubble_40",
             "date": "06/01/2020"]) { (error) in
                print(error)
            }
//            Firestore.firestore().collection("menuSalads").addDocument(data: ["imageURL": "", "name":"", "order": 0]) { (error) in
//                print(error)
//            }
//            Firestore.firestore().collection("menuSalads").addDocument(data: ["imageURL": "", "name":"", "order": 0]) { (error) in
//                print(error)
//            }
//            Firestore.firestore().collection("menuSalads").addDocument(data: ["imageURL": "", "name":"", "order": 0]) { (error) in
//                           print(error)
//                       }
//                       Firestore.firestore().collection("menuSalads").addDocument(data: ["imageURL": "", "name":"", "order": 0]) { (error) in
//                           print(error)
//                       }
        }

        return true
    }

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

