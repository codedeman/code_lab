//
//  SupportCovidWorker.swift
//  AppLab
//
//  Created by Pham Kien on 20.03.22.
//

import Foundation
import RxSwift


protocol SupportCovidRequestProtocol {
    func getSection() -> Observable<SectionManager>
}

class SupportCovidModel:BaseRequest,SupportCovidRequestProtocol {
    
    func getSection() -> Observable<SectionManager> {
        return super.createRequest(url: "https://codedeman.github.io/ssd_api/home.json")
    }
}
