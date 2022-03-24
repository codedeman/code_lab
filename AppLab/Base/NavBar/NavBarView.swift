//
//  NavBarView.swift
//  AppLab
//
//  Created by Pham Kien on 23.02.22.
//

import UIKit

class NavBarView: UIView {
    var onLeftBtnClick: (() -> Void)?

    @IBOutlet weak var vContent: UIView!

    @IBOutlet weak var vSearch: UIView!
    
    @IBOutlet weak var contraintVSearch: NSLayoutConstraint!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var vContainAvatar: UIView!
    @IBOutlet weak var txtSearch: UITextField!
    
    @IBOutlet weak var trallingVSearch: NSLayoutConstraint!
    
    @IBOutlet weak var btnCancel: UIButton!
    
    var onSearch: (() -> Void)?
    var onCancel: (() -> Void)?


    override  func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.loadNibNamed("NavBarView", owner: self, options: nil)
            self.vContent.fixInView(self)
        self.vSearch.layer.cornerRadius = 5
        self.vSearch.clipsToBounds = true
        
        txtSearch.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEvents)
        self.btnCancel.isHidden = true

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        gradient.colors = [UIColor.init(hexaRGB: "#84c113")?.cgColor,UIColor.init(hexaRGB: "#004d29")?.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradient.locations =  [0.0,0.5,1.0]
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func didTabLeftBtn(_ sender: Any) {
        self.onLeftBtnClick!()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.onSearch!()
        UIView.animate(withDuration: 0.5) {
            self.contraintVSearch.constant = 10
            self.vContainAvatar.frame.origin.y = 0
            self.vContainAvatar.isHidden = true
            self.lblTitle.isHidden = true
            self.btnCancel.isHidden = false
            self.trallingVSearch.constant = 60
        }
    }
    
    
    
    @IBAction func didTabCancelBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.contraintVSearch.constant = 60
            self.vContainAvatar.isHidden = false
            self.lblTitle.isHidden = false
            self.btnCancel.isHidden = true
            self.trallingVSearch.constant = 15
            self.onCancel!()
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
