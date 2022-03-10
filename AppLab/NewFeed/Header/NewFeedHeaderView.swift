//
//  NewFeedHeaderView.swift
//  AppLab
//
//  Created by Pham Kien on 23.02.22.
//

import UIKit
import RxSwift
import RxCocoa


class NewFeedHeaderView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
//    private var dataSet = Observe <UserModel>()
    let disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "NewFeedHeaderCell", bundle: nil), forCellWithReuseIdentifier: "NewFeedHeaderCell")
//        let user1  = UserModel(name: "Kevin", imageUrl: "avtartest")
//        dataSet.onNext(user1)
//        dataSet.bind(collectionView.rx.items) { (collection: UICp, index: Int, element: String) in
//
//        }
        
//        dataSet = [UserModel(name: "Kevin", imageUrl: "avtartest"),UserModel(name: "Casey", imageUrl: "bubble_full"),UserModel(name: "Casey", imageUrl: "bubble_full"),UserModel(name: "Casey", imageUrl: "bubble_full"),UserModel(name: "Casey", imageUrl: "bubble_full")]
        
//        dataSet.bind(to: collectionView.rx.items) {
//              (collectionView: collectionView, index: Int, element: String) in
//              let indexPath = IndexPath(item: index, section: 0)
//
//              guard  let cell:NewFeedCell = tableView.dequeueReusableCell(withIdentifier: "NewFeedCell",for: indexPath) as? NewFeedCell else {return UITableViewCell()}
//
//              cell.lblName.text = element
//        return cell }
//          .disposed(by: disposeBag)
    
    }
}
