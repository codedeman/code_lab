//
//  NewRoomModel.swift
//  AppLab
//
//  Created by Pham Kien on 09.03.22.
//

import Foundation


struct ResponseModel:Codable,Hashable {
    var version:String = ""
    var components:[Component]
}

struct Component:Codable,Hashable {
    var type:String = ""
    var data:[DataModel]
}

struct DataModel:Codable,Hashable {
    var id:String = ""
    var image_url:String = ""
    var name:String = ""
    var price:String = ""

}
