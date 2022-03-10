//
//  NewFeedViewController.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import RxSwift
import RxCocoa
import Firebase
import FirebaseAnalytics
// MARK: Presenter Interface

protocol NewFeedPresentationLogic: AnyObject {
//    var listUser:Observable<[UserModel]> {get}
}

// MARK: View
class NewFeedViewController: BaseViewController {
    var interactor: NewFeedInteractorLogic!
    var router: NewFeedRoutingLogic!
    
    var ref: DatabaseReference!

    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var heighNavBar: NSLayoutConstraint!
    var headerView:NewFeedHeaderView!
    let disposeBag = DisposeBag()

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        blindindTaleView()
        setNavi()
    
    }
    
    func setNavi() {
        self.naviView.onLeftBtnClick = {[weak self] in
            
        }
        self.naviView.onSearch = { [weak self] in
            guard let wSelf = self else {return}
            wSelf.heighNavBar.constant = 60
        }
        self.naviView.onCancel = {[weak self] in
            guard let wSelf = self else {return}
            wSelf.heighNavBar.constant = 110
        }
    }
    
    func blindindTaleView() {
        
        let cities = Observable.of(["Lisbon", "Copenhagen", "London", "Madrid",
       "Vienna"])
        tableView.register(UINib(nibName: "NewFeedCell", bundle: nil), forCellReuseIdentifier: "NewFeedCell")
        cities
          .bind(to: tableView.rx.items) {
              (tableView: UITableView, index: Int, element: String) in
              let indexPath = IndexPath(item: index, section: 0)

              guard  let cell:NewFeedCell = tableView.dequeueReusableCell(withIdentifier: "NewFeedCell",for: indexPath) as? NewFeedCell else {return UITableViewCell()}

              cell.lblName.text = element
        return cell }
          .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(String.self).subscribe { [weak self] element in
            print("element \(element)")
            guard let wSelf = self else {return}
            wSelf.router.openPersonalChat()
//            router.openPersonalChat()
        } onError: { error  in
            print("error \(error)")
        } 

//        self.interactor
//
//        cities.bind(to: tableView.rx.items(cellIdentifier: "NewFeedCell")) { index, model, cell in
////          cell.textLabel?.text = model
//
//            cell
//        }
         

    }
    
    // MARK: Fetch NewFeed
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tableView.separatorStyle = .none
        headerView = NewFeedHeaderView.instantiateFromXib()
        
        self.tableView.tableHeaderView = headerView
        
        let data = Database.database().reference()
        data.child("feed").observeSingleEvent(of: .value) { [weak self] feedMessageSnapShot  in
            print("feed snapshot \(feedMessageSnapShot)")
        }
        
        


    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension NewFeedViewController: NewFeedPresentationLogic {
//    var listUser: Observable<[UserModel]> {
//        
//    }
    
//    var listUser: Observable<[UserModel]> {
//
//
//    }
//
   
    
}
