//
//    MainViewControllerTests.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

@testable import RadioHermitage
import XCTest

class MainViewControllerTests: XCTestCase {
    // MARK: Subject under test

    var controller: MainViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMainViewController()
    }

    override func tearDown() {
        window = nil
        controller = nil
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainViewController() {
        controller = MainViewController()
    }

    func loadView() {
        window.addSubview(controller.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Test doubles

    class MainBusinessLogicSpy: MainBusinessLogic, MainDataStore {
        var makeRequestCalled = false
        var toggleCalled = false

        func makeRequest(request: Main.Model.Request.RequestType) {
            makeRequestCalled = true

            switch request {
            case .toggle:
                toggleCalled = true
            }
        }
    }

    // MARK: Tests

    func testDisplayPlay() {
        // Given
        let title = NSLocalizedString("Stop", tableName: "Main", comment: "main scene")

        // When
        loadView()
        controller.displayData(viewModel: .displayPlay)

        // Then
        XCTAssertEqual(controller.button.title(for: .normal), title)
    }

    func testDisplayStop() {
        // Given
        let title = NSLocalizedString("Play", tableName: "Main", comment: "main scene")

        // When
        loadView()
        controller.displayData(viewModel: .displayStop)

        // Then
        XCTAssertEqual(controller.button.title(for: .normal), title)
    }

    func testToggle() {
        // Given
        let interactor = MainBusinessLogicSpy()
        controller.interactor = interactor

        // When
        loadView()
        controller.toggle()

        // Then
        XCTAssertTrue(interactor.toggleCalled)
    }

}
