//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Randy Efan Jayaputra on 11/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let main = CharacterListModule()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = main.view
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        return true
    }
}

