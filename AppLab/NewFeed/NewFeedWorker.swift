//
//  NewFeedWorker.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import Firebase
import RxSwift
import RxCocoa

let DB_BASE = Database.database().reference()


protocol NewFeedWorkerLogic {
    func performGetFeed(handler:@escaping(_ messsage:[String:Any])->())
}

class NewFeedWorker: NewFeedWorkerLogic {
    // MARK: Business Logic
    private var _REF_FEED = DB_BASE.child("feed")

    var REF_FEED: DatabaseReference {
            return _REF_FEED
    }
    func performGetFeed(handler: @escaping ([String:Any]) -> ()) {
        
        REF_FEED.observeSingleEvent(of: .value) { userSnapShot in
            
        }
        
    }
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
