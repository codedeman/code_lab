//
//  NewRoomInteractor.swift
//  AppLab
//
//  Created Pham Kien on 09.03.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// NewRoom Module Interactor Protocol
protocol NewRoomInteractorLogic {
    
    func performGetUser()
}

/// NewRoom Module Interactor
class NewRoomInteractor {
    weak var presenter: NewRoomPresentationLogic!
    weak var router: NewRoomRoutingLogic!
    private var worker: NewRoomWorkerLogic
    
    required init(withWorker worker: NewRoomWorkerLogic) {
        self.worker = worker
    }
}

extension NewRoomInteractor: NewRoomInteractorLogic {

    func performGetUser() {
        
        worker.performGetUser { response in
            
            print("response ----- \(response)")
        }
    }
}

