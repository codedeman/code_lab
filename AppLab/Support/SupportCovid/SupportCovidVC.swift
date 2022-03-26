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
    
    var similarObjects: PublishSubject<[SectionModel]> = PublishSubject<[SectionModel]>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpRXDataSource()
    }
    
    
    
    
    func setUpRXDataSource() {
        //
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib.init(nibName:"DesComponentCell" , bundle: nil), forCellReuseIdentifier: "DesComponentCell")
        self.tableView.register(UINib.init(nibName:"SourceAccountCell" , bundle: nil), forCellReuseIdentifier: "SourceAccountCell")

        
        self.tableView.backgroundColor = .clear
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        self.repositoryCovid.getSection().subscribe { secModel  in
            secModel.map { sec in
                self.similarObjects.onNext(sec.sections)
            }
        }.disposed(by: disposeBag)
        
        similarObjects.subscribe { subject  in
            subject.map {$0.compactMap { section in
                let type = ElementType.init(rawValue: section.sectionComponentType ?? "")
                if type == .background {
                    self.setUpBG(urlString:section.section?.images?.first ?? "")
                } else if type == .navBar {
                    self.navigationItem.title = section.section?.title
                }
            }}
        }
    self.similarObjects.bind(to: tableView.rx.items) { table, index, element in
            let type = ElementType.init(rawValue: element.sectionComponentType ?? "")
            switch type {
            case .description:
                let component =  DesComponentModel.init(textArtibute: (element.section?.title?.htmlToAttributedString)!, uiImage: UIImage(), url: "")
                return self.desComponent(with: component, from: table)
            case .sourceAccount:
                return self.accountComponent(with: element.section?.title ?? "", from: table)
            default:
                return self.makeCell(with:  element.section?.title ?? "", from: table)
            }
        }.disposed(by: disposeBag)
    }
    
    private func makeCell(with element: String, from table: UITableView) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "Cell") else {return UITableViewCell()}
        return cell
    }
    
    private func desComponent(with element: DesComponentModel, from table: UITableView) -> UITableViewCell {
       guard  let cell = table.dequeueReusableCell(withIdentifier: "DesComponentCell") as? DesComponentCell  else {return UITableViewCell()}
        cell.binding(data: element)
        return cell
    }
    private func accountComponent(with element: String, from table: UITableView) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "SourceAccountCell") as? SourceAccountCell else {return UITableViewCell()}
        return cell
    }
    
    
    

}