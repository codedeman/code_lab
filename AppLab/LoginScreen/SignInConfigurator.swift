//
//  SignInConfigurator.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SignInConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> SignInViewController {
        
        //MARK: Initialise components.
        let viewController = SignInViewController(nibName: "SignInViewController", bundle: nil)
        let interactor = SignInInteractor(withWorker: SignInWorker())
        let router = SignInRouter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
