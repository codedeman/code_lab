//
//  NewFeedInteractor.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// NewFeed Module Interactor Protocol
protocol NewFeedInteractorLogic {
    
}

/// NewFeed Module Interactor
class NewFeedInteractor {
    weak var presenter: NewFeedPresentationLogic!
    weak var router: NewFeedRoutingLogic!
    private var worker: NewFeedWorkerLogic
    
    required init(withWorker worker: NewFeedWorkerLogic) {
        self.worker = worker
    }
}

extension NewFeedInteractor: NewFeedInteractorLogic {

}

