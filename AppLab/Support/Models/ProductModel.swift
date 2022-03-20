//
//  ProductModel.swift
//  AppLab
//
//  Created by Pham Kien on 17.03.22.
//

import Foundation

struct ProductModel:Codable {
    var version: String?
    var components:[ProductComponent]
}

struct ProductComponent:Codable,Hashable {
    var type:String?
    var data:[ProductItemModel]
}

struct ProductItemModel:Codable,Hashable {
    var image_url:String?
    var price:String?
    var name:String?
    var id:String?
}

struct ActionModel:Codable,Hashable {
    var autoScroll:Int?
}

