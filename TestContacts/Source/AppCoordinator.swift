//
//  AppCoordinator.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

protocol AppCoordinator {
    var rootNavigationController: UINavigationController { get }
    func start ()
}

final class MainCoordinator: AppCoordinator {
    var window: UIWindow
    var rootNavigationController: UINavigationController
    
    init(window : UIWindow) {
        self.window = window
        self.rootNavigationController = UINavigationController()
    }
    
    func start() {
        let viewModel = ContactsViewModelImplementation()
        viewModel.coordinator = self
        let vc = ContactsViewController(viewModel: viewModel)
        rootNavigationController.setViewControllers([vc], animated: false)
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
    
    func showSingleContact(_ contact: Contact, complition: ((Contact) -> Void)?) {
        let viewModel = SingleContactViewModelImplementation(contact: contact, complition: complition)
        let vc = SingleContactViewController(viewModel: viewModel)
        rootNavigationController.pushViewController(vc, animated: true)
    }
}
