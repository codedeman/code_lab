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
    
//    @IBOutlet weak var btnLogin: GradientButton!
    
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
    
    @IBAction func didTabSignUpBtn(_ sender: Any) {
        router.openSignUp()
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
        self.txtUserName.txtInput.text = "kevin@gmail.com"
        self.txtPassWorld.txtInput.text = "111111"
        
//        btnLogin.layer.cornerRadius = 10
//        btnLogin.clipsToBounds = true
//        self.vContainer.layer.cornerRadius = 10
//        self.vContainer.clipsToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        
    }
    
    @IBAction func didTabLoginBtn(_ sender: Any) {
        guard let emailText = txtUserName.txtInput.text else {return}
        guard let passworldText = txtPassWorld.txtInput.text else {return}
        self.interactor.performSignIn(email: emailText, passworld: passworldText)
       
    }
    
    // MARK: IBAction
}


// MARK: Connect View, Interactor, and Presenter
extension SignInViewController: SignInPresentationLogic {
    
    
}
