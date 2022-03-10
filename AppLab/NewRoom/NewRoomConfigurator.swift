//
//  NewRoomConfigurator.swift
//  AppLab
//
//  Created Pham Kien on 09.03.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewRoomConfigurator {
    
    // MARK: Configuration
    class func viewcontroller() -> NewRoomViewController {
        
        //MARK: Initialise components.
        let viewController = NewRoomViewController(nibName: "NewRoomViewController", bundle: nil)
        let interactor = NewRoomInteractor(withWorker: NewRoomWorker())
        let router = NewRoomRouter()
        
        //MARK: link VIP components.
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = viewController
        interactor.router = router
        
        router.viewController = viewController

        return viewController
    }
}
