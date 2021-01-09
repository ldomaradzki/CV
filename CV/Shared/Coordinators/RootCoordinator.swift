//
//  RootCoordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import MessageUI

class RootCoordinator: NSObject, AppCoordinator {
    var appContext: Context
    var childCoordinators: [Coordinator] = []
    var displayContainer: DisplayContainer?
    
    private let splitViewContainer = SplitViewController()
    
    var selectedMenu: MenuRow? {
        didSet {
            removeContentCoordinator()
            setupContent(selectedMenu)
        }
    }
    
    init(container: DisplayContainer?, appContext: Context) {
        self.appContext = appContext
        self.displayContainer = container
    }

    func start() {
        displayContainer?.display(splitViewContainer)
        
        setupMenu()
    }
    
    private func setupMenu() {
        let menuCoordinator = MenuCoordinator(appContext: appContext, container: splitViewContainer.primaryDisplay)
        childCoordinators.append(menuCoordinator)
        menuCoordinator.delegate = self
        menuCoordinator.start()
    }
    
    private func removeContentCoordinator() {
        childCoordinators = childCoordinators.filter { $0 is MenuCoordinator }
        splitViewContainer.secondaryDisplay.removeViewController()
    }
    
    private func setupContent(_ menu: MenuRow?) {
        guard let menu = menu else { return }
        
        let coordinator: AppCoordinator
        switch menu {
        case .about:
            coordinator = AboutCoordinator(appContext: appContext, container: splitViewContainer.secondaryDisplay)
        case .skills:
            coordinator = SkillsCoordinator(appContext: appContext, container: splitViewContainer.secondaryDisplay)
        case .experience:
            coordinator = ExperienceCoordinator(appContext: appContext, container: splitViewContainer.secondaryDisplay)
        case .education:
            coordinator = EducationCoordinator(appContext: appContext, container: splitViewContainer.secondaryDisplay)
        }
        
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

extension RootCoordinator: MenuDelegate {
    func tappedContactMe() {
        let mailAddress = "lukasz.domaradzki@gmail.com"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([mailAddress])

            splitViewContainer.present(mail, animated: true)
        } else if let mailto = URL(string: "mailto:\(mailAddress)") {
            UIApplication.shared.open(mailto, options: [:], completionHandler: nil)
        }
    }
    
    func didSelect(menu: MenuRow) {
        guard menu != selectedMenu else { return }
        
        selectedMenu = menu
    }
}

extension RootCoordinator: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
