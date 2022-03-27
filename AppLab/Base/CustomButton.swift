//
//  CustomButton.swift
//  AppLab
//
//  Created by Pham Kien on 27.03.22.
//

import Foundation
import UIKit

enum StyleButton:String {
    case NONE = ""
    case CONTINUE = "CONTINUE"
    case CONTINUE_DISABLE = "CONTINUE_DISABLE"
    case CONTINUE_SECONDARY = "CONTINUE_SECONDARY"
    case BORDER_PRIMARY = "BORDER_PRIMARY"
    case BORDER_SECONDARY = "BORDER_SECONDARY"
}
@IBDesignable class CustomButton:UIButton {
    
    private var gradientLayer:CAGradientLayer!
    
    func setButtonStyle(style:StyleButton) {
        self.buttonstyle = style.rawValue
    }
    
    @IBInspectable var startPointX: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    @IBInspectable private var buttonstyle: String? {  // <-- warning here
        didSet {
            let style = StyleButton.init(rawValue: buttonstyle ?? "")
            switch style {
            case .CONTINUE:
                
                self.gradientLayer = self.layer as? CAGradientLayer
                self.gradientLayer.colors = [UIColor.init(hexaRGB: "#5fb621"),UIColor.init(hexaRGB: "#007c30")] as! [Any]
                self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
                self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
                break
            default:
                break
            }
        }
    }
        
    
}
