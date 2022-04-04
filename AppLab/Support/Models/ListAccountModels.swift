//
//  ListAccountModels.swift
//  AppLab
//
//  Created by Pham Kien on 31.03.22.
//

import Foundation

struct AcountResponse:Codable {
    var mid:String?
    var code:String?
    var des:String?
    var lnAccounts:[AccountModels]
}
struct AccountModels:Codable,Hashable {
    var resCode:String?
    var accountNo:String?
    var newAccountNo:String?
    var accountType:String?
    var accountCurr:String?
    var accountStatus:String?
    var status:String?
    var availBalance:String?

//    var openDate:String?
//    var productTypeCode:String?
//    var groupCode:String?
//    var accountNumber:String?
//    var alias:String?
//    var pdtNumber:Int?
//    var rowNum:Int?
//    
//    var facilityNo: String?
//    var approvedAmmout:String?
//    var approvedDate:String?
//    var acctRelation:String?

//    "resCode": "0",
//               "cif": "3594746",
//               "accountNo": "0548000034606",
//               "newAccountNo": "000018290548",
//               "accountType": "L ",
//               "accountCurr": "VND",
//               "accountStatus": " ",
//               "status": " ",
//               "availBalance": "695,000,000",
//               "availableBalance": "695000000.0",
//               "openDate": "2018-08-31",
//               "productTypeCode": "30020",
//               "groupCode": "0",
//               "accountNumber": "000018290548",
//               "accountName": "NGUY H NH",
//               "currency": "VND",
//               "alias": "0548000034606",
//               "pdtNumber": 0,
//               "rowNum": 0,
//               "facilityNo": "169/18/PGDVH",
//               "approvedAmmout": 795000000.0,
//               "approvedDate": "2018-08-31",
//               "acctRelation": "SOW"
}
