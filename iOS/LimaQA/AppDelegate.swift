//
//  AppDelegate.swift
//  LimaQA
//
//  Created by Pavlo Yevtukhov on 18.07.2025.
//

import Lima
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        let demoStoreURL = URL(string: "https://apps.apple.com/us/app/demo-app/id1234567")!
        LimaUtil.shared.initSDK(storeUrl: demoStoreURL)

        return true
    }
}
