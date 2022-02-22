//
//  NewFeedCell.swift
//  AppLab
//
//  Created by Pham Kien on 22.02.22.
//

import UIKit

class NewFeedCell: UITableViewCell {

    @IBOutlet weak var ivAvatar: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblContent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ivAvatar.layer.cornerRadius = self.ivAvatar.frame.width/2
        self.ivAvatar.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
