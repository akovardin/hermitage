//
//    MainPresenterTests.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

@testable import RadioHermitage
import XCTest

class MainPresenterTests: XCTestCase {
    // MARK: Subject under test

    var presenter: MainPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupMainPresenter()
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainPresenter() {
        presenter = MainPresenter()
    }

    // MARK: Test doubles

    class MainDisplayLogicSpy: MainDisplayLogic {
        var displayDataCalled = false
        var displayPlayCalled = false
        var displayStopCalled = false

        func displayData(viewModel: Main.Model.ViewModel.ViewModelData) {
            displayDataCalled = true

            switch viewModel {
            case .displayPlay(let image):
                displayPlayCalled = true
            case .displayStop:
                displayStopCalled = true
            }
        }
    }

    // MARK: Tests

    func testPresentPlay() {
        // Given
        let controller = MainDisplayLogicSpy()
        presenter.viewController = controller

        // When
        presenter.presentData(response: .presentPlay(image: "example"))

        // Then
        XCTAssertTrue(controller.displayDataCalled)
        XCTAssertTrue(controller.displayPlayCalled)
    }

    func testPresentStop() {
        // Given
        let controller = MainDisplayLogicSpy()
        presenter.viewController = controller

        // When
        presenter.presentData(response: .presentStop)

        // Then
        XCTAssertTrue(controller.displayDataCalled)
        XCTAssertTrue(controller.displayStopCalled)
    }

}
