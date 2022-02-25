//
//  SignUpInteractor.swift
//  AppLab
//
//  Created Pham Kien on 23.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// SignUp Module Interactor Protocol
protocol SignUpInteractorLogic {
    
}

/// SignUp Module Interactor
class SignUpInteractor {
    weak var presenter: SignUpPresentationLogic!
    weak var router: SignUpRoutingLogic!
    private var worker: SignUpWorkerLogic
    
    required init(withWorker worker: SignUpWorkerLogic) {
        self.worker = worker
    }
}

extension SignUpInteractor: SignUpInteractorLogic {

}

