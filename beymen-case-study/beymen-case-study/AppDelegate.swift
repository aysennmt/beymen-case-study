//
//  AppDelegate.swift
//  beymen-case-study
//
//  Created by Ayşe Nur Nimetoğlu on 18.01.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let productListVC = ProductListFlowAssembly.assemble()
        let navigationController = UINavigationController(rootViewController: productListVC)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
