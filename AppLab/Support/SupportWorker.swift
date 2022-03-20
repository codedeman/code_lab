//
//  SupportWorker.swift
//  AppLab
//
//  Created by Pham Kien on 17.03.22.
//

import Foundation
import RxSwift

protocol SuportRequestDelegate {
    func getProduct() -> Observable<ProductModel>
}

class SupportRequest:BaseRequest,SuportRequestDelegate {
    func getProduct() -> Observable<ProductModel> {
        return super.createRequest(url: "https://codedeman.github.io/ssd_api/sdu.json")
    }
    
    
    
}
