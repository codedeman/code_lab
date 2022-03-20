//
//  ProductCell.swift
//  AppLab
//
//  Created by Pham Kien on 19.03.22.
//

import UIKit
import Alamofire

class ProductCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindingData(object:ProductItemModel) {
//        let url = URL(string: <#T##String#>)
        URLSession.shared.dataTask(with: URL(string: object.image_url ?? "")!) { data, response, error in
            DispatchQueue.main.async {
                self.imgProduct.image = UIImage(data: data!)
            }
        }.resume()
        self.lblName.text = object.name
        self.lblDescription.text = object.price
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
