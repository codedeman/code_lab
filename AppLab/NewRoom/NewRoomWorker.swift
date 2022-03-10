//
//  NewRoomWorker.swift
//  AppLab
//
//  Created Pham Kien on 09.03.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Combine
import Foundation

protocol NewRoomWorkerLogic {

    func performGetUser(response:@escaping(_ response:[String:Any])->())

}

class NewRoomWorker: NewRoomWorkerLogic {
    var cancellable: AnyCancellable?

    func performGetUser(response: @escaping ([String : Any]) -> ()) {
        let url = URL(string: "https://api.github.com/users/itsmeichigo/repos")!
        cancellable =  URLSession.shared.dataTaskPublisher(for: url).sink { completion in
            switch completion {
            case .finished:
                print("rq  finished")
            case let .failure(error):
                print("Get repos failed: \(error)")
            }
        } receiveValue: { (data, resonse)  in
            
            let jsonDecoder = JSONDecoder()
            do {
               let object = try jsonDecoder.decode(ResponseModel.self, from: data)
                print("object data \(object.version)")
            } catch  {
                
            }
            
            
        }

        
    }
    
    // MARK: Business Logic
    
    func doSomeWork() {
        // NOTE: Do the work
    }
}
