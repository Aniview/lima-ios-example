//
//  LimaQAApp.swift
//  LimaQA
//
//  Created by Pavlo Yevtukhov on 17.07.2025.
//

import SwiftUI

@main
struct LimaQAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            URLMergeView()
        }
    }
}
