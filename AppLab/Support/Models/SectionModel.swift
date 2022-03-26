//
//  SectionModel.swift
//  AppLab
//
//  Created by Pham Kien on 20.03.22.
//

import Foundation

enum ElementType:String {
    case background = "BACKGROUND"
    case navBar = "Navbar"
    case footer = "FOOTER"
    case description = "Des"
    case sourceAccount = "SOURCEACCOUNT"
}
struct SectionManager:Codable {
    
    var sections:[SectionModel]
//    var screens:[ScreenModel]
}

struct ScreenModel:Codable {
    
    var id:String?
    var screenProperties:ScreenProperties?
    var layout:LayoutModes?
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

struct SectionTypeModel:Codable,Hashable{
    var type:String?
    var images:[String]?
    var title:String?
    var nav_button:NavButton?
}

struct NavButton:Codable,Hashable {
    var onClickAction:NavAction?
}

struct NavAction:Codable,Hashable {
    var type:String?
    var screenId:String?
}
