//
//  SignInWorker.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Firebase

protocol SignInWorkerLogic {
    func performRegister(withEmail email:String, andPassworld passworl:String)
    func performSignIn(withEmail email:String, andPassworld passworl:String ,loginCompleted:@escaping (_ status:Bool,_ error:Error?)->())
}

class SignInWorker: SignInWorkerLogic {
    func performSignIn(withEmail email: String, andPassworld passworl: String, loginCompleted: @escaping (Bool, Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: passworl) { user, error in
            print("test user \(user?.description)")
            if error != nil {
                loginCompleted(false,error)
            }
            loginCompleted(true, nil)
        }
    }
    
    func performRegister(withEmail email: String, andPassworld passworl: String) {
        
    }
    
   
    
    // MARK: Business Logic
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
