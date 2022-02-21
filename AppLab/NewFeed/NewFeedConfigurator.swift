//
//  NewFeedConfigurator.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewFeedConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> NewFeedViewController {
        
        //MARK: Initialise components.
        let viewController = NewFeedViewController(nibName: "NewFeedViewController", bundle: nil)
        let interactor = NewFeedInteractor(withWorker: NewFeedWorker())
        let router = NewFeedRouter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
