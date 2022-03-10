//
//  RepoListModel.swift
//  AppLab
//
//  Created by Pham Kien on 10.03.22.
//

import Foundation
import Combine

struct Repo: Decodable {
    let name: String
    let description: String?
    let language: String?
}

class RepoListModel {
//    var cancellable: AnyCancellable?
    @Published var repoDetail: Repo?
    func fetchRepo() {
        let url = URL(string: "https://api.github.com/users/itsmeichigo/repos")!
                URLSession.shared.dataTaskPublisher(for: url)
                    .sink (receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            print("Get repos finished")
                        case let .failure(error):
                            print("Get repos failed: \(error)")
                        }
                    }, receiveValue: { (data, response) in
                        print("Got repos data: \(data)")
                    })
    }
    
}
