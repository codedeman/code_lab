//
//  SourceAccountCell.swift
//  AppLab
//
//  Created by Pham Kien on 25.03.22.
//

import UIKit


class SourceAccountCell: UITableViewCell {

    @IBOutlet weak var lblTile: UILabel!
    
    @IBOutlet weak var vSourceAccount: UIView!
    @IBOutlet weak var ivComponent: UIImageView!
    
    @IBOutlet weak var lblContent: UILabel!
    
    @IBOutlet weak var lblSubtile: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.vSourceAccount.layer.cornerRadius = 10
        self.vSourceAccount.clipsToBounds = true

    }
    
    func binding(data:SectionTypeModel) {
        self.lblTile.attributedText = data.title?.htmlToAttributedString
        self.lblContent.attributedText = data.content?.title?.htmlToAttributedString
        self.ivComponent.image 
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
