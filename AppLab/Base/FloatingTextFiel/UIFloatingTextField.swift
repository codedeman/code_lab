//
//  UIFloatingTextField.swift
//  AppLab
//
//  Created by Pham Kien on 21.02.22.
//

import UIKit

class UIFloatingTextField: UIView {

    @IBOutlet weak var vContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    
//    @IBOutlet weak var vContainTextField: UIView!
    @IBOutlet weak var vContainTextField: UIView!
    
    var title:String = ""
    
    var placeHodler:String = "" {
        didSet {
            self.txtInput.placeholder = placeHodler
        }
    }
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.loadNibNamed("UIFloatingTextField", owner: self, options: nil)
        vContent.fixInView(self)
        txtInput.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.vContainTextField.layer.cornerRadius = 5
        self.vContainTextField.clipsToBounds = true
        self.vContainTextField.layer.borderWidth = 1
        self.vContainTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.lblTitle.text = ""

    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        if textField.text?.count ?? 0 > 0 {
            self.lblTitle.text = title
        } else {
            self.lblTitle.text = ""
        }

    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
