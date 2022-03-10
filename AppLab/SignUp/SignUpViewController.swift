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
protocol SignUpPresentationLogic: AnyObject {
    
}

// MARK: View
class SignUpViewController: BaseViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var interactor: SignUpInteractorLogic!
    var router: SignUpRoutingLogic!
    
    // MARK: IBOutlet
    
    @IBOutlet weak var txtEmail: UIFloatingTextField!
    
    @IBOutlet weak var txtPassWorld: UIFloatingTextField!
    
    @IBOutlet weak var txtRePassworld: UIFloatingTextField!
    
    @IBOutlet weak var imgAvatarPreview: UIImageView!
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchDataOnLoad()
    }
    
    
    @IBAction func didTabChoseAvatarBtn(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary

        image.allowsEditing = false

        self.present(image, animated: true)
        {
            //after its completed
        }
    }
    
    @IBAction func didTabCreateBtn(_ sender: Any) {
        
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
