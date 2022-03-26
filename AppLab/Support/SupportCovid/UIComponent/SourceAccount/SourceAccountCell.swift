//
//  SourceAccountCell.swift
//  AppLab
//
//  Created by Pham Kien on 25.03.22.
//

import UIKit
//import SDW
class SourceAccountCell: UITableViewCell {

    @IBOutlet weak var lblTile: UILabel!
    
    @IBOutlet weak var vSourceAccount: UIView!
    @IBOutlet weak var ivComponent: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblSubtile: UILabel!
    @IBOutlet weak var vSub: UIView!
    @IBOutlet weak var vBene: UIView!
    
    @IBOutlet weak var vSpacing: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.vSourceAccount.layer.cornerRadius = 10
        self.vSourceAccount.clipsToBounds = true
        self.vSourceAccount.alpha = 0.95

    }
    
    func binding(data:SectionTypeModel) {
        
        let elemenType = ElementType.init(rawValue: data.type ?? "")
        
        if elemenType == .bene {
            self.vSub.isHidden = true
            self.vBene.backgroundColor = UIColor.white
            self.vBene.alpha = 0.19
            self.vBene.clipsToBounds = true
            self.vBene.layer.cornerRadius = 10
            self.vSpacing.isHidden = false
        } else {
            self.vSub.isHidden = false
            self.vSpacing.isHidden = true

            
        }
        self.lblTile.attributedText = data.title?.htmlToAttributedString
        self.lblContent.attributedText = data.content?.title?.htmlToAttributedString
        self.lblSubtile.attributedText = data.content?.subtitle?.htmlToAttributedString
        guard let url = URL(string: data.images?.first ?? "") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {return}
//                self.imgBG.image = UIImage(data: data)
                self.ivComponent.image = UIImage(data: data)
            }
        }.resume()
        
        
    }
    
    @IBAction func didTabSAccountBtn(_ sender: Any) {
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
