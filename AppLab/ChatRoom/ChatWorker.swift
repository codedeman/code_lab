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


//import SwiftUI
public enum StorageErrors:Error {
    case failedToUpload
    case failedToDownLoad
}

public typealias UploadPictureCompletion = (Result<String,Error>)->Void


protocol ChatWorkerLogic {
    func uploadProfilePicture(with data:Data,fileName:String,completion:@escaping UploadPictureCompletion)
}

class ChatWorker: ChatWorkerLogic {
    let storage = Storage.storage().reference()

    func uploadProfilePicture(with data: Data, fileName: String, completion:@escaping UploadPictureCompletion) {
        
        storage.child("images/\(fileName)").putData(data, metadata: nil, completion: { metadata, error in
            guard let error = error else {
                print("fail to upload data firebase for picture")
                completion(.failure(StorageErrors.failedToUpload))
                return
            }
            
            self.storage.child("images/\(fileName)").downloadURL { url, error in
                
                guard let url = url else {
                    completion(.failure(StorageErrors.failedToDownLoad))
                    return
                }
                
            }

        })
        
    }
    


//    // MARK: Business Logic
//    func uploadProfilePicture(with data: Data, fileName: String, completion: @escaping (String) -> ()) {
//        (
//
//
////            storage.child("images/\(fileName)").pu
////        storage
//
//    }
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
