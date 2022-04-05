//
//  SourceAccountCell.swift
//  AppLab
//
//  Created by Pham Kien on 25.03.22.
//

import UIKit
//import SDW
protocol SourceAccountCellDelegate:AnyObject {
    func didSelectItems(navigation:NavAction)
}
class SourceAccountCell: UITableViewCell {
    
//    var index:IndexPath!
    
    var nav_button:NavButton?

    @IBOutlet weak var lblTile: UILabel!
    @IBOutlet weak var vSourceAccount: UIView!
    @IBOutlet weak var ivComponent: UIImageView!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblSubtile: UILabel!
    @IBOutlet weak var vSub: UIView!
    @IBOutlet weak var vBene: UIView!
    @IBOutlet weak var vSpacing: UIView!
    @IBOutlet weak var lblNote: UILabel!
    @IBOutlet weak var lblAccount: UILabel!
    @IBOutlet weak var ivNote: UIImageView!
    
    @IBOutlet weak var lblAvaiable: UILabel!
    
    weak var delegate:SourceAccountCellDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.vSourceAccount.layer.cornerRadius = 10
        self.vSourceAccount.clipsToBounds = true
        self.vSourceAccount.alpha = 0.95

    }
    
    func binding(data:SectionTypeModel) {
        self.nav_button = data.nav_button
        let elemenType = SectionType.init(rawValue: data.type ?? "")
        switch elemenType {
        case .bene:
            self.vSub.isHidden = true
            self.vBene.backgroundColor = UIColor.white
            self.vBene.alpha = 0.19
            self.vBene.clipsToBounds = true
            self.vBene.layer.cornerRadius = 10
            self.vSpacing.isHidden = false
            break
        case .sourceAccount:
            self.vSub.isHidden = false
            self.vSpacing.isHidden = true
            self.lblAccount.text = data.titleAccount
            self.lblAvaiable.attributedText = data.availBalance?.htmlToAttributedString
        case .trans:
            self.vSpacing.isHidden = false
            self.vSub.isHidden = true
            self.lblTile.attributedText = data.right_title?.htmlToAttributedString
            self.lblNote.attributedText = data.right_title?.htmlToAttributedString
            guard let url2 = URL(string: data.images?[1] ?? "") else {return}
            
            URLSession.shared.dataTask(with: url2) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data else {return}
                    self.ivNote.image = UIImage(data: data)
                }
            }.resume()
            
        default:
            break

        }
        self.lblTile.attributedText = data.title?.htmlToAttributedString
        self.lblContent.attributedText = data.content?.title?.htmlToAttributedString
        self.lblSubtile.attributedText = data.content?.subtitle?.htmlToAttributedString
        guard let url = URL(string: data.images?.first ?? "") else {return}
       
      
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data else {return}
                self.ivComponent.image = UIImage(data: data)
            }
        }.resume()
        
        
    }
    
    @IBAction func didTabSAccountBtn(_ sender: Any) {
        let actonType = ActionType.init(rawValue: nav_button?.onClickAction?.type ?? "")
        if actonType == .popup {
            self.delegate.didSelectItems(navigation: (nav_button?.onClickAction)!)
        }

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension SourceAccountCellDelegate where Self:SupportCovidVC {
  func  didSelectItems(navigation: NavAction) {
      
      self.showPopUp(title: "Tai khoan nguon", dataSource: self.sourceAcount, cellClass: <#T##Cell.Type#>) { <#Cell#>, <#PopupSelectionModel#>, <#Int#> in
          <#code#>
      }
//      let vc = PopUpBaseVC<self.sourceAcount, SearchSupportPopUpCell;>.initWithNib()
//      vc.config
  }
}
