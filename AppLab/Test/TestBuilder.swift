//
//  TestBuilder.swift
//  AppLab
//
//  Created by Pham Kien on 24.02.22.
//

import RIBs

protocol TestDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TestComponent: Component<TestDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TestBuildable: Buildable {
    func build(withListener listener: TestListener) -> TestRouting
}

final class TestBuilder: Builder<TestDependency>, TestBuildable {

    override init(dependency: TestDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TestListener) -> TestRouting {
        let component = TestComponent(dependency: dependency)
        let viewController = TestViewController()
        let interactor = TestInteractor(presenter: viewController)
        interactor.listener = listener
        return TestRouter(interactor: interactor, viewController: viewController)
    }
}
