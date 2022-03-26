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
    case bene = "BENE"
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

//    var screenProperties:ScreenProperties?
//    var layout:LayoutModes?
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

struct SectionTypeModel:Codable,Hashable{
    var type:String?
    var images:[String]?
    var title:String?
    var nav_button:NavButton?
    var content:Content?
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
