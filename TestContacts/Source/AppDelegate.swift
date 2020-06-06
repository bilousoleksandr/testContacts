//
//  AppDelegate.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

protocol AppDelegateProtocol {
    var coordinator: AppCoordinator! { get }
    var context: AppContext! { get }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppDelegateProtocol {
    static let shared = UIApplication.shared.delegate as! AppDelegateProtocol
    var window: UIWindow?
    var coordinator: AppCoordinator!
    var context: AppContext!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        context = Context.context()
        let startWindow = UIWindow(frame: UIScreen.main.bounds)
        window = startWindow
        coordinator = MainCoordinator(window: startWindow)
        coordinator.start()
        return true
    }
}

