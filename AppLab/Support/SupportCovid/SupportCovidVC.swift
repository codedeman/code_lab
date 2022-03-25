//
//  SupportCovidVC.swift
//  AppLab
//
//  Created by Pham Kien on 20.03.22.
//

import UIKit
import RxCocoa
import RxSwift

class SupportCovidVC: BaseViewController {

    let repositoryCovid:SupportCovidModel = SupportCovidModel()
    @IBOutlet weak var imgBg: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vComponent: DesViewComponent!
    let disposeBag = DisposeBag()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DM"

        
        self.repositoryCovid.getSection().subscribe { screenModel in
                screenModel.map { section in
                    section.sections.compactMap { sectionModel in
                        
                        if let section = sectionModel.section {
                            self.renderUI(section:section)
                        }
                    }
                }
        }.disposed(by: disposeBag)
        // Do any additional setup after loading the view.
    }
    
    func setUpRXDataSource() {
//
        self.tableView.register(UINib.init(nibName:"DesComponentCell" , bundle: nil), forCellReuseIdentifier: "DesComponentCell")
        
        
        
        
    }
    
    func renderUI(section:SectionTypeModel) {
        print("section type \(section.type)")
        let elementType = ElementType.init(rawValue: section.type ?? "1")
        switch elementType {
        case .background:
            self.setUpBG(url: section.images?.first ?? "")
        case .navBar:
            self.navigationItem.title = section.title
            self.navigationItem.titleView?.tintColor = .white
        case .footer:
            break
        case .description:
        
            let compnent = DesComponentModel.init(textArtibute: (section.title?.htmlToAttributedString)!, uiImage: UIImage())
            vComponent.binding(data: compnent)
        default:
            break
            
        }
        
        
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
