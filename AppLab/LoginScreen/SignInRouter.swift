//
//  SignInRouter.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

protocol SignInRoutingLogic: class {
    func openNewFeed()
    func openChatRoom()
    func openSignUp()
}

class SignInRouter {
    weak var viewController: SignInViewController!
}

extension SignInRouter: SignInRoutingLogic {
   
    func openSignUp() {
        
        let vc = NewRoomConfigurator.viewcontroller()
        self.viewController.navigationController?.pushViewController(vc, animated: true)
    }
    func openNewFeed() {
        let vc = NewFeedConfigurator.viewcontroller()
        self.viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openChatRoom() {
        let vc = ChatConfigurator.viewcontroller()
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Navigation
    /* Example
    func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        // 1. Trigger a storyboard segue
        // viewController.performSegueWithIdentifier("ShowSomewhereScene", sender: nil)
        // 2. Present another view controller programmatically
        // viewController.presentViewController(someWhereViewController, animated: true, completion: nil)
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController.navigationController?.pushViewController(someWhereViewController, animated: true)
    } */
}
