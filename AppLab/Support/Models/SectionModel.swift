//
//  SectionModel.swift
//  AppLab
//
//  Created by Pham Kien on 20.03.22.
//

import Foundation

enum SectionType:String {
    case description = "Des"
    case sourceAccount = "SOURCEACCOUNT"
    case bene = "BENE"
    case trans = "TRAN"
}
struct SectionManager:Codable {
    
    var sections:[SectionModel]
    var screens:[ScreenModel]
}

struct ScreenModel:Codable {
    var id:String?
    var main:MainScreen
    var nav:ComponentModel?
    var footer:ComponentModel?
}
struct MainScreen:Codable {
    var images:[String]?
    var type:String?
}

struct ComponentModel:Codable {
    var type:String?
    var title:String?
}


struct ScreenProperties:Codable {
    
}
struct LayoutModes:Codable {
//    var wide:AnyObject?
//    var compact:
}

struct SectionModel:Codable {
    
    var id:String?
    var sectionComponentType:String?
    var section:SectionTypeModel?
    
}

class SectionTypeModel:Codable{
//    static func == (lhs: SectionTypeModel, rhs: SectionTypeModel) -> Bool {
//        return lhs.type == rhs.type
//    }
    
    var type:String?
    var images:[String]?
    var title:String?
    var right_title:String?
    var nav_button:NavButton?
    var content:Content?
    var  titleAccount:String?
}

struct Content:Codable,Hashable {
    
    var title:String?
    var subtitle:String?
    
}

struct NavButton:Codable,Hashable {
    var onClickAction:NavAction?
}

struct NavAction:Codable,Hashable {
    var type:String?
    var screenId:String?
}
