//
//  SignUpConfigurator.swift
//  AppLab
//
//  Created Pham Kien on 23.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SignUpConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> SignUpViewController {
        
        //MARK: Initialise components.
        let viewController = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        let interactor = SignUpInteractor(withWorker: SignUpWorker())
        let router = SignUpRouter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
