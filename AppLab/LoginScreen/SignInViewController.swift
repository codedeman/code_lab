//
//  SignInViewController.swift
//  AppLab
//
//  Created Pham Kien on 21.02.22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import RxSwift
// MARK: Presenter Interface
protocol SignInPresentationLogic: AnyObject {
    
}

// MARK: View
class SignInViewController: BaseViewController {
    var interactor: SignInInteractorLogic!
    var router: SignInRoutingLogic!
    
    @IBOutlet weak var txtUserName: UIFloatingTextField!
    
    @IBOutlet weak var txtPassWorld: UIFloatingTextField!
    
    @IBOutlet weak var btnLogin: GradientButton!
    
    @IBOutlet weak var vContainer: UIView!
    
    // MARK: IBOutlet
    
    let helloSequence = Observable.of("Hello Rx")

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
        
        let subscription = helloSequence.subscribe { event in
            
            print()
        }
    }
    
    // MARK: Fetch SignIn
    private func fetchDataOnLoad() {
        // NOTE: Ask the Interactor to do some work
        
    }
    
    // MARK: SetupUI
    private func setupView() {
        self.txtUserName.title = "User Name"
        self.txtUserName.placeHodler = "User Name"
        
        self.txtPassWorld.title = "Pass World"
        self.txtPassWorld.placeHodler = "Pass Word"
        
        btnLogin.layer.cornerRadius = 10
        btnLogin.clipsToBounds = true
        self.vContainer.layer.cornerRadius = 10
        self.vContainer.clipsToBounds = true
        
        
    }
    
    @IBAction func didTabLoginBtn(_ sender: Any) {
        guard let emailText = txtUserName.txtInput.text else {return}
        guard let passworldText = txtPassWorld.txtInput.text else {return}
//        self.interactor.performSignIn(email: emailText, passworld: passworldText)
        let vc = ChatConfigurator.viewcontroller()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: IBAction
}

// MARK: Connect View, Interactor, and Presenter
extension SignInViewController: SignInPresentationLogic {
    
    
}
