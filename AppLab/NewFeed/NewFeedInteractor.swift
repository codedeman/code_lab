//
//  NewFeedInteractor.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

/// NewFeed Module Interactor Protocol

import RxSwift
import RxCocoa
import Foundation

protocol DataSource:AnyObject {
}
protocol NewFeedInteractorLogic:AnyObject{
//    var messageObject:BehaviorRelay<[String:Any]> {get}

//    var dataSource:DataSource!
    func performGetNewFeed()
    
}


/// NewFeed Module Interactor
class NewFeedInteractor {
    
    
    weak var presenter: NewFeedPresentationLogic!
    weak var router: NewFeedRoutingLogic!
    
    private var worker: NewFeedWorkerLogic
//    var messageObject: BehaviorRelay<[String : Any]>

    
    required init(withWorker worker: NewFeedWorkerLogic) {
        self.worker = worker
    }
}

extension NewFeedInteractor: NewFeedInteractorLogic {
    
    func performGetNewFeed() {
        
        worker.performGetFeed { [weak self] messsage in
//            self.messageObject = messsage
        }
    }
    

}

