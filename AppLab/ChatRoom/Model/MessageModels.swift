//
//  MessageModels.swift
//  AppLab
//
//  Created by Pham Kien on 22.02.22.
//

import Foundation
import MessageKit

struct Message:MessageType {
    
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
}

struct Sender:SenderType {
    var senderId: String
    var displayName: String
    var photoURl:String
    
    
}

//struct Message:MessageType {
//
//}
