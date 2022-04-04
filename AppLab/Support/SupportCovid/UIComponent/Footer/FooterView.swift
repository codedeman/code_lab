//
//  FooterView.swift
//  AppLab
//
//  Created by Pham Kien on 27.03.22.
//

import UIKit

class FooterView: UIView {

    
    @IBOutlet weak var btnContinue: CustomButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.btnContinue.setButtonStyle(style: .CONTINUE)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
