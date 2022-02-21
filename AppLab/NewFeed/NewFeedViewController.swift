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
// MARK: Presenter Interface
protocol NewFeedPresentationLogic: AnyObject {
    
}

// MARK: View
class NewFeedViewController: BaseViewController {
    var interactor: NewFeedInteractorLogic!
    var router: NewFeedRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
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
