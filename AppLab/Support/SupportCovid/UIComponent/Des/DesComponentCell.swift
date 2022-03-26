//
//  DesComponentCell.swift
//  AppLab
//
//  Created by Pham Kien on 25.03.22.
//

import UIKit

class DesComponentCell: UITableViewCell {

    @IBOutlet weak var ivComponent: UIImageView!
    
    @IBOutlet weak var lblComponent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func binding(data:DesComponentModel) {
//        self.ivComponent.image = data.uiImage
        self.lblComponent.attributedText = data.textArtibute
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
