//
//  TestViewController.swift
//  AppLab
//
//  Created by Pham Kien on 24.02.22.
//

import RIBs
import RxSwift
import UIKit

protocol TestPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TestViewController: UIViewController, TestPresentable, TestViewControllable {

    weak var listener: TestPresentableListener?
}
