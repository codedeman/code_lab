//
//  SignUpViewController.swift
//  AppLab
//
//  Created Pham Kien on 23.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

// MARK: Presenter Interface
protocol SignUpPresentationLogic: class {
    
}

// MARK: View
class SignUpViewController: BaseViewController {
    var interactor: SignUpInteractorLogic!
    var router: SignUpRoutingLogic!
    
    // MARK: IBOutlet
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    // MARK: Fetch SignUp
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension SignUpViewController: SignUpPresentationLogic {
    
}
