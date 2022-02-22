//
//  ChatInteractor.swift
//  AppLab
//
//  Created Pham Kien on 22.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// Chat Module Interactor Protocol
protocol ChatInteractorLogic {
    
}

/// Chat Module Interactor
class ChatInteractor {
    weak var presenter: ChatPresentationLogic!
    weak var router: ChatRoutingLogic!
    private var worker: ChatWorkerLogic
    
    required init(withWorker worker: ChatWorkerLogic) {
        self.worker = worker
    }
}

extension ChatInteractor: ChatInteractorLogic {

}

