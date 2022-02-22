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
// MARK: Presenter Interface
protocol NewFeedPresentationLogic: AnyObject {
    
}

// MARK: View
class NewFeedViewController: BaseViewController {
    var interactor: NewFeedInteractorLogic!
    var router: NewFeedRoutingLogic!
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    let disposeBag = DisposeBag()

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        blindindTaleView()
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
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension NewFeedViewController: NewFeedPresentationLogic {
    
}
