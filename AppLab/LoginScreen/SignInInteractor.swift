//
//  SignInInteractor.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// SignIn Module Interactor Protocol
protocol SignInInteractorLogic {
    
    func performSignIn(email:String,passworld:String)
}

/// SignIn Module Interactor
class SignInInteractor {
    weak var presenter: SignInPresentationLogic!
    weak var router: SignInRoutingLogic!
    private var worker: SignInWorkerLogic
    
    required init(withWorker worker: SignInWorkerLogic) {
        self.worker = worker
    }
}

extension SignInInteractor: SignInInteractorLogic {
    func performSignIn(email: String, passworld: String) {
        
        worker.performSignIn(withEmail: email, andPassworld: passworld) { status, error in
            if status{
                self.router.openNewFeed()
            }
        }
    }
    

}

