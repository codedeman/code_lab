//
//  ViewController.swift
//  AppLab
//
//  Created by Pham Kien on 21.02.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTabOpenBtn(_ sender: Any) {
        let vc = SupportCovidVC.initWithNib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

