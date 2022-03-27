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
    
    var sectionObject: PublishSubject<[SectionModel]> = PublishSubject<[SectionModel]>()
    var screenObj:PublishSubject<[ScreenModel]> = PublishSubject<[ScreenModel]>()

//    var accComponent:SourceAccountCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpRXDataSource()
        self.setUI()
    }
    
    func setUI() {
        
        self.tableView.tableFooterView  = FooterView.instantiateFromXib()
//        accComponent = SourceAccountCell.instantiateFromXib()
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
                self.sectionObject.onNext(sec.sections)
                self.screenObj.onNext(sec.screens)
            }
        }.disposed(by: disposeBag)
        
        screenObj.subscribe { screenModel in
            screenModel.map {$0.flatMap { screenObj in
                self.navigationItem.title = screenObj.nav?.title
                self.navigationItem.titleView?.tintColor = .white
                self.setUpBG(urlString: screenObj.main.images?.first ?? "")
            }}
        }.disposed(by: disposeBag)
        self.sectionObject.bind(to: tableView.rx.items) { table, index, element in
            let type = SectionType.init(rawValue: element.sectionComponentType ?? "")
            switch type {
            case .description:
                let component =  DesComponentModel.init(textArtibute: (element.section?.title?.htmlToAttributedString)!, uiImage: UIImage(), url: "")
                return self.desComponent(with: component, from: table)
            case .sourceAccount:
                if let section = element.section {
                    return self.accountComponent(with: section, from: table)
                }
                return UITableViewCell()
            case .bene:
                if let section = element.section  {
                    return self.accountComponent(with: section, from: table)
                }
                return UITableViewCell()
            case .trans:

                if let section = element.section  {
                    return self.accountComponent(with: section, from: table)
                }
                return UITableViewCell()

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
    private func accountComponent(with element: SectionTypeModel, from table: UITableView) -> UITableViewCell {
        let cell = SourceAccountCell.instantiateFromXib()
        cell.binding(data: element)
        return cell
    }
    
    
    

}
