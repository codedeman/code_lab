//
//  GradientButton.swift
//  AppLab
//
//  Created by Pham Kien on 21.02.22.
//

import UIKit

@IBDesignable  class GradientView: UIView {

    
    private var gradientLayer: CAGradientLayer!

    
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
    
    @IBInspectable var startColor: UIColor = UIColor(red: 35.0/255.0, green: 2.0/255.0, blue: 2.0/255.0, alpha: 1.0) {
        didSet {
            setNeedsLayout()
        }
    }
    
    // the gradient end colour
    @IBInspectable var endColor: UIColor = UIColor(red: 192.0/255.0, green: 38.0/255.0, blue: 42.0/255.0, alpha: 1.0) {
        didSet {
            setNeedsLayout()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    private func installGradient() {
        
    }
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
