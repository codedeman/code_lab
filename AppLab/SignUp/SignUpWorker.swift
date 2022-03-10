//
//  SignUpWorker.swift
//  AppLab
//
//  Created Pham Kien on 23.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import Firebase
import Foundation


protocol SignUpWorkerLogic {
  
    func performSignUp(withEmail email:String,password:String, userCreationComplete:@escaping (_ status:Bool,_ error:Error?)->())
    
    func uploadProfilePicture(data:Data,fileName:String,completion:@escaping UploadPictureCompletion)

}

class SignUpWorker: SignUpWorkerLogic {
    let storage = Storage.storage().reference()

    func uploadProfilePicture(data: Data, fileName: String, completion: @escaping UploadPictureCompletion) {
        
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
                print("response -----  \(url)")
                
            }
        })
        
    }
    
    
    private var _REF_USERS = DB_BASE.child("users")

    func performSignUp(withEmail email: String, password: String, userCreationComplete: @escaping (Bool, Error?) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            guard let user = authResult?.user else {
                userCreationComplete(false,error)
                return
            }
            
            let newCollection:[[String:String]] = [["name":email,
                                                    "email":password
                                                   ]]
            
            userCreationComplete(true,nil)
            
        
        }
    }
    
    func createDBUser(uid:String,userData:Dictionary<String,Any>) {
        _REF_USERS.child(uid).updateChildValues(userData)
    }
    
    // MARK: Business Logic
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
