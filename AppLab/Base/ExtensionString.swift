//
//  ExtensionString.swift
//  AppLab
//
//  Created by Pham Kien on 23.03.22.
//

import Foundation
import UIKit

extension String {
    
    public var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil).trim()
        } catch {
            return nil
        }
    }
}




extension NSAttributedString {
//    func heightForLabel(containerWidth: CGFloat) -> CGFloat {
//        let lbl = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: containerWidth, height: CGFloat.greatestFiniteMagnitude))
//        lbl.attributedText = self
//        lbl.numberOfLines = 0
//        lbl.lineBreakMode = NSLineBreakMode.byWordWrapping
//        lbl.sizeToFit()
//        return lbl.vnpsdk_height;
//    }
//    
//    func heightForTextView(containerWidth: CGFloat) -> CGFloat {
//        let rect = self.boundingRect(with: CGSize.init(width: containerWidth, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading, .truncatesLastVisibleLine, .usesDeviceMetrics], context: nil)
//        return ceil(rect.size.height)
//    }
//    
//    func width(containerHeight: CGFloat) -> CGFloat {
//        let rect = self.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: containerHeight), options: [.usesLineFragmentOrigin, .usesFontLeading, .truncatesLastVisibleLine, .usesDeviceMetrics], context: nil)
//        return ceil(rect.size.width)
//    }
    
    func trim() -> NSAttributedString {
        let invertedSet = CharacterSet.whitespacesAndNewlines.inverted
        let startRange = string.rangeOfCharacter(from: invertedSet)
        let endRange = string.rangeOfCharacter(from: invertedSet, options: .backwards)
        guard let startLocation = startRange?.lowerBound, let endLocation = endRange?.lowerBound else {
            return self
        }
        let range = NSRange(startLocation...endLocation, in: string)
        return attributedSubstring(from: range)
    }
}
