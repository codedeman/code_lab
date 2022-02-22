//
//  ChatConfigurator.swift
//  AppLab
//
//  Created Pham Kien on 22.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ChatConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> ChatViewController {
        
        //MARK: Initialise components.
        let viewController = ChatViewController(nibName: "ChatViewController", bundle: nil)
        let interactor = ChatInteractor(withWorker: ChatWorker())
        let router = ChatRouter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
