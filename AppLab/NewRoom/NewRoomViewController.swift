//
//  NewRoomViewController.swift
//  AppLab
//
//  Created Pham Kien on 09.03.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol NewRoomPresentationLogic: class {
    
}

// MARK: View
class NewRoomViewController: BaseViewController {
    var interactor: NewRoomInteractorLogic!
    var router: NewRoomRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch NewRoom
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
        self.interactor.performGetUser()
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension NewRoomViewController: NewRoomPresentationLogic {
    
}
