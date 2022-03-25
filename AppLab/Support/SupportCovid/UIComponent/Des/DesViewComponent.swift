//
//  DesViewComponent.swift
//  AppLab
//
//  Created by Pham Kien on 23.03.22.
//

import UIKit

struct DesComponentModel {
    var textArtibute:NSAttributedString
    var uiImage:UIImage
}
class DesViewComponent: UIView {

    @IBOutlet weak var ivComponent: UIImageView!
    
    @IBOutlet weak var lblComponent: UILabel!
    
    @IBOutlet weak var vContent: UIView!
    
    func binding(data:DesComponentModel) {
        self.ivComponent.image = data.uiImage
        self.lblComponent.attributedText = data.textArtibute
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = .red
        Bundle.main.loadNibNamed("DesViewComponent", owner: self, options: nil)
            self.vContent.fixInView(self)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
