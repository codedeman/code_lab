//
//  ChatWorker.swift
//  AppLab
//
//  Created Pham Kien on 22.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import Firebase
import Firebase

//import SwiftUI

let store = Storage.storage()
protocol ChatWorkerLogic {
    func uploadProfilePicture(with data:Data,fileName:String,completion:@escaping(String)->())
}

class ChatWorker: ChatWorkerLogic {
    // MARK: Business Logic
    // u
    func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping (String) -> ()) {
        
        
    }
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
