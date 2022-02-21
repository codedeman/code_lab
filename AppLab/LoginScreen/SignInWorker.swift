//
//  SignInWorker.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

protocol SignInWorkerLogic {
    func performRegister(withEmail email:String, andPassworld passworl:String)
}

class SignInWorker: SignInWorkerLogic {
    func performRegister(withEmail email: String, andPassworld passworl: String) {
        
    }
    
    // MARK: Business Logic
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
