//
//  RepoViewController.swift
//  AppLab
//
//  Created by Pham Kien on 10.03.22.
//

import UIKit
import Combine
import Foundation

class RepoViewController: BaseViewController {
    var viewModel =  RepoListModel()
    var cancellable: AnyCancellable?

    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.lblTitle.text = "omg"
        
////
        cancellable = viewModel.$repoDetail
                    .map { $0?.name }
                    .assign(to: \.text, on: lblTitle)
        viewModel.fetchRepo()


        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
