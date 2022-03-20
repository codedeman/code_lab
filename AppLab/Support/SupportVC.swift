//
//  SupportVC.swift
//  AppLab
//
//  Created by Pham Kien on 17.03.22.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class SupportVC: BaseViewController {

    @IBOutlet weak var navC: UIView!
    @IBOutlet weak var tableView: UITableView!
    let respository:SupportRequest = SupportRequest()
    let disposeBag = DisposeBag()
    var productModel:Observable<[ProductItemModel]>?
    
    
    var productBH:BehaviorRelay<[ProductItemModel]>?
    var similarObjects: PublishSubject<[ProductItemModel]> = PublishSubject<[ProductItemModel]>()
//    var behaviorSubJect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = self.navC.frame
        gradient.colors = [UIColor.init(hexaRGB: "#84c113")?.cgColor,UIColor.init(hexaRGB: "#004d29")?.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradient.locations =  [0.0,0.5,1.0]
        self.navC.layer.insertSublayer(gradient, at: 0)


        self.navigationItem.title = "Fuck your idiot";

        
        
//        self.navigationController?.title = "Fuck😄".uppercased()
//        self.
        tableView.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
            
        self.tableView.separatorStyle = .none
        respository.getProduct().subscribe { dataSource in
            dataSource.map {$0.components.flatMap { product in
                
                self.similarObjects.onNext(product.data)
            }}}.disposed(by: disposeBag)
        
        self.similarObjects.bind(to: self.tableView.rx.items(cellIdentifier: "ProductCell",cellType: ProductCell.self)) { (index, element,cell) in
            cell.bindingData(object: element)
            
        }.disposed(by: disposeBag)
        
        self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
    }
    
        
}

extension SupportVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}

//extension UIColor {
//
//    convenience init?(hexaRGB: String, alpha: CGFloat = 1) {
//        var chars = Array(hexaRGB.hasPrefix("#") ? hexaRGB.dropFirst() : hexaRGB[...])
//        switch chars.count {
//        case 3: chars = chars.flatMap { [$0, $0] }
//        case 6: break
//        default: return nil
//        }
//        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
//                green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
//                 blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
//                alpha: alpha)
//    }
//}
//


        

    
        

        
        
        


  
