//
//  PopUpBaseVC.swift
//  AppLab
//
//  Created by Pham Kien on 04.04.22.
//

import UIKit
import RxSwift
import RxCocoa


class SearchSupportPopUpCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        
    }
}


 class PopUpBaseVC<Item:PopupSelectionModel,Cell:SearchSupportPopUpCell> :BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
     
     @IBOutlet weak var tableView: UITableView!
     var dataSource:BehaviorRelay<[Item]> = BehaviorRelay(value: [])
     public var configureCell : ((Cell, Item, Int) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("cell class \(Cell.self)")
        tableView.register(UINib.init(nibName: "\(Cell.self)", bundle: nil), forCellReuseIdentifier: "\(Cell.self)")
        dataSource.bind(to: self.tableView.rx.items(cellIdentifier: "\(Cell.self)",cellType: Cell.self)) { [self] (index,element,cell)  in
            configureCell?(cell,element,index)
        }
        
//        self.similarObjects.bind(to: self.tableView.rx.items(cellIdentifier: "ProductCell",cellType: ProductCell.self)) { (index, element,cell) in
//            cell.bindingData(object: element)
//
//        }.disposed(by: disposeBag)

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
