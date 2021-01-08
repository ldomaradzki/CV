//
//  AppDelegate.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = {
        let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
        return UIWindow(frame: scene.coordinateSpace.bounds)
    }()
    
    /// Main entry coordinator, initilizes root view controller
    lazy var rootCoordinator: Coordinator? = {
        RootCoordinator(container: window, appContext: AppContext())
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        rootCoordinator?.start()
        
        return true
    }
}

