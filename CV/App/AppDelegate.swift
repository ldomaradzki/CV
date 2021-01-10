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
    
    private var rootCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        CoreDataService.createPersistentContainer {
            [unowned self] container in
            let appContext = AppContext(container)
            self.rootCoordinator = RootCoordinator(container: self.window, appContext: appContext)
            self.rootCoordinator?.start()
        }
        
        return true
    }
}
