//
//  TestRouter.swift
//  AppLab
//
//  Created by Pham Kien on 24.02.22.
//

import RIBs

protocol TestInteractable: Interactable {
    var router: TestRouting? { get set }
    var listener: TestListener? { get set }
}

protocol TestViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TestRouter: ViewableRouter<TestInteractable, TestViewControllable>, TestRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TestInteractable, viewController: TestViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
