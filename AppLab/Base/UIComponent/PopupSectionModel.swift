//
//  PopupSectionModel.swift
//  AppLab
//
//  Created by Pham Kien on 04.04.22.
//

import Foundation

protocol PopupSelectionModel: Equatable {
    // state
    var isSelected: Bool { get set }
    
    func search(with text: String) -> Bool
}

extension PopupSelectionModel {
    // left title simple
    var leftContent: String { "" }
    
    func search(with text: String) -> Bool {
        fatalError("This abstract method and should be override by subclass")
    }
}
